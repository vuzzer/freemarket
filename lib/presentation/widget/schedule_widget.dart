import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/create_unique_id.dart';
import 'package:defi/core/cron_expression.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/data/datasource/notification/notification_price_data.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/presentation/blocs/notification-price/notification_price_bloc.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/presentation/widget/switch_widget.dart';
import 'package:defi/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ScheduleWidget extends StatefulWidget {
  final CryptoInfo crypto;
  final Alert alert;
  final bool isUpdate;
  const ScheduleWidget(
      {super.key,
      required this.alert,
      required this.crypto,
      required this.isUpdate});

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  late ValueNotifier<TimeFrame> marketOpenNotifier;
  late ValueNotifier<TimeFrame> midDayNotifier;
  late ValueNotifier<TimeFrame> marketCloseNotifier;
  ValueNotifier<bool> buttonNotifier = ValueNotifier<bool>(false);
  Map<String, TimeFrame> memoNotifier =
      {}; // store value of notifier for update

  @override
  void initState() {
    marketOpenNotifier = ValueNotifier<TimeFrame>(const TimeFrame(
        title: "Market open",
        desc: "You'll be notified daily at 9:00 am EST",
        cron: CronExpression.morning));
    midDayNotifier = ValueNotifier<TimeFrame>(const TimeFrame(
        title: "Mid-day",
        desc: "You'll be notified daily at 12:00 pm EST",
        cron: CronExpression.noon));
    marketCloseNotifier = ValueNotifier<TimeFrame>(const TimeFrame(
        title: "Market close",
        desc: "You'll be notified daily at 4:00 pm EST",
        cron: CronExpression.night));

    // Execute in case of update
    if (widget.isUpdate) {
      dailyNotification(widget.crypto.id);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          const AutoSizeText(
            "When would you like to receive daily Bitcoin alerts ?",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          ValueListenableBuilder(
            valueListenable: marketOpenNotifier,
            builder: (context, timeFrame, child) {
              return SwitchWidget(
                  timeFrame: timeFrame, onChange: onChangeMarketOpen);
            },
          ),
          ValueListenableBuilder(
            valueListenable: midDayNotifier,
            builder: (context, timeFrame, child) {
              return SwitchWidget(
                  timeFrame: timeFrame, onChange: onChangeMidDay);
            },
          ),
          ValueListenableBuilder(
            valueListenable: marketCloseNotifier,
            builder: (context, timeFrame, child) {
              return SwitchWidget(
                  timeFrame: timeFrame, onChange: onChangeMarketClose);
            },
          ),
          const Spacer(),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ValueListenableBuilder(
                valueListenable: buttonNotifier,
                builder: (context, enabled, child) => ButtonWidget(
                  disable: enabled ? false : true,
                  onPressed: () {
                    if (widget.isUpdate) {
                      update();
                    } else {
                      final listNotif = createDailyNotif();

                      context
                          .read<NotificationPriceBloc>()
                          .add(CreateNotificationFromList(listNotif));
                    }
                    Navigator.of(context).popUntil(
                        ModalRoute.withName(CryptoAssetScreen.routeName));
                  },
                  title: widget.isUpdate ? "Update alert" : "Create alert",
                  raduis: 10,
                ),
              )),
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 35, top: 10),
            child: ButtonWidget(
              onPressed: () => Navigator.of(context)
                  .popUntil(ModalRoute.withName(CryptoAssetScreen.routeName)),
              color: blue1,
              title: "Dismiss",
              raduis: 10,
            ),
          ),
        ]));
  }

  Future<void> update() async {
    final openMarket = memoNotifier[CronExpression.morning]!.value !=
        marketOpenNotifier.value.value;
    final midDay =
        memoNotifier[CronExpression.noon]!.value != midDayNotifier.value.value;
    final closeMarket = memoNotifier[CronExpression.night]!.value !=
        marketCloseNotifier.value.value;

    List<NotificationCrypto> notifications = [];
    final allDailyNotification = await sl<NotificationPriceData>()
        .allDailyNotificationCreated(widget.crypto.id);

    // TimeFrame
    final List<Map<String, dynamic>> timeFrames = [
      {'activate': openMarket, 'timeFrame': marketOpenNotifier.value},
      {'activate': midDay, 'timeFrame': midDayNotifier.value},
      {'activate': closeMarket, 'timeFrame': marketCloseNotifier.value}
    ];

    // Create New daily notification if not exist
    for (var data in timeFrames) {
      final bool activate = data['activate'];
      final TimeFrame timeFrame = data['timeFrame'];
      if (activate && timeFrame.value) {
        final id = createUniqueId();
        notifications.add(NotificationCrypto(
            idNotification: id,
            cryptoId: widget.crypto.id,
            cron: timeFrame.cron,
            image: widget.crypto.image,
            typeNotification: widget.alert.value));
      }
    }

    // Create New daily notification
    if (notifications.isNotEmpty) {
      // Update state indirectly
      await sl<NotificationPriceData>()
          .createNotificationFromList(notifications);
    }

    // Delete daily notification unchecked
    for (var notification in allDailyNotification) {
      switch (notification.cron) {
        case CronExpression.morning:
          if (openMarket) {
            await sl<NotificationPriceData>()
                .deleteNotificationPrice(notification.idNotification);
          }
          break;
        case CronExpression.noon:
          if (midDay) {
            await sl<NotificationPriceData>()
                .deleteNotificationPrice(notification.idNotification);
          }
          break;
        default:
          if (closeMarket) {
            await sl<NotificationPriceData>()
                .deleteNotificationPrice(notification.idNotification);
          }
          break;
      }
    }

    //Update state App
    sl<NotificationPriceBloc>().add(GetNotificationPrice(widget.crypto.id));
  }

  // get daily notification
  Future<void> dailyNotification(String cryptoId) async {
    final allDailyNotification =
        await sl<NotificationPriceData>().allDailyNotificationCreated(cryptoId);
    for (var notification in allDailyNotification) {
      switch (notification.cron) {
        case CronExpression.morning:
          marketOpenNotifier.value =
              marketOpenNotifier.value.copyWith(value: true);
          break;
        case CronExpression.noon:
          midDayNotifier.value = midDayNotifier.value.copyWith(value: true);
          break;
        default:
          marketCloseNotifier.value =
              marketCloseNotifier.value.copyWith(value: true);
          break;
      }
    }
    memoNotifier = {
      CronExpression.morning: marketOpenNotifier.value,
      CronExpression.noon: midDayNotifier.value,
      CronExpression.night: marketCloseNotifier.value
    };
  }

  // Check if all switch is active or not to
  // enable button to create or update notification
  void onChangeButton() {
    final isMarketOpen = marketOpenNotifier.value.value;
    final isMidDay = midDayNotifier.value.value;
    final isMarketClose = marketCloseNotifier.value.value;

    // All option checked, so button(update or create) is enable
    // All button not checked. so button(update or create) is disable
    if (isMarketClose && isMarketOpen && isMidDay) {
      buttonNotifier.value = true;
    } else if (!isMarketClose && !isMarketOpen && !isMidDay) {
      buttonNotifier.value = false;
    } else {
      buttonNotifier.value = true;
    }
  }

  void onUpdateButton() {
    // Check if notifier of each kind daily
    // notification has changed
    bool active = memoNotifier[CronExpression.morning]!.value ==
        marketOpenNotifier.value.value;
    active = active &&
        (memoNotifier[CronExpression.noon]!.value ==
            midDayNotifier.value.value);
    active = active &&
        (memoNotifier[CronExpression.night]!.value ==
            marketCloseNotifier.value.value);
    if (active) {
      buttonNotifier.value = false;
    } else {
      buttonNotifier.value = true;
    }
  }

  // Create a list notification for daily alert
  List<NotificationCrypto> createDailyNotif() {
    List<NotificationCrypto> notifications = [];
    final timeFrames = [
      marketCloseNotifier.value,
      marketOpenNotifier.value,
      midDayNotifier.value
    ];

    // Create a list of notification according option time activate
    for (var timeFrame in timeFrames) {
      if (timeFrame.value) {
        final id = createUniqueId();
        notifications.add(NotificationCrypto(
            idNotification: id,
            cryptoId: widget.crypto.id,
            cron: timeFrame.cron,
             image: widget.crypto.image,
            typeNotification: widget.alert.value));
      }
    }
    return notifications;
  }

  void onChangeMarketOpen(bool value) {
    marketOpenNotifier.value = marketOpenNotifier.value.copyWith(value: value);
    if (widget.isUpdate) {
      onUpdateButton();
    } else {
      onChangeButton();
    }
  }

  void onChangeMidDay(bool value) {
    midDayNotifier.value = midDayNotifier.value.copyWith(value: value);
    if (widget.isUpdate) {
      onUpdateButton();
    } else {
      onChangeButton();
    }
  }

  void onChangeMarketClose(bool value) {
    marketCloseNotifier.value =
        marketCloseNotifier.value.copyWith(value: value);
    if (widget.isUpdate) {
      onUpdateButton();
    } else {
      onChangeButton();
    }
  }
}
