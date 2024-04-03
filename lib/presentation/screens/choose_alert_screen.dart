import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/arguments_screen.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/data/datasource/notification/notification_price_data.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:defi/presentation/screens/set_alert_screen.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/presentation/widget/categorie_notification_widget.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/styles/font_family.dart';
import 'package:defi/styles/media_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChooseAlertScreen extends StatefulWidget {
  static const routeName = "/choose-currency";

  const ChooseAlertScreen({super.key});

  @override
  State<ChooseAlertScreen> createState() => _ChooseAlertScreenState();
}

class _ChooseAlertScreenState extends State<ChooseAlertScreen> {
  // ValueNotifier : listen to change of option

  final ValueNotifier<AlertValue> alertNotifierDefaultValue =
      ValueNotifier<AlertValue>(AlertValue.schedular);

  //Definition of alert options
  List<Alert> alertOptions = [
     Alert(
        title: LocaleKeys.price.tr(),
        desc: LocaleKeys.chooseAlertScreen_price.tr(),
        image: "assets/images/price.png",
        icon: Icons.attach_money,
        value: AlertValue.price),
     Alert(
        title: LocaleKeys.percentageIncrease.tr(),
        desc: LocaleKeys.chooseAlertScreen_percentageIncrease.tr(),
        image: "assets/images/increase.png",
        icon: Icons.add,
        value: AlertValue.increase),
     Alert(
        title: LocaleKeys.percentageDecrease.tr(),
        desc: LocaleKeys.chooseAlertScreen_percentageIncrease.tr(),
        image: "assets/images/decrease.png",
        icon: Icons.remove,
        value: AlertValue.decrease),
     Alert(
        title: LocaleKeys.calendar.tr(),
        desc: LocaleKeys.chooseAlertScreen_calendar.tr(),
        image: "assets/images/calendar.png",
        value: AlertValue.schedular),
  ];

  //Parameters for set_alert_screen
  Alert param = Alert(
        title: LocaleKeys.calendar.tr(),
        desc: LocaleKeys.chooseAlertScreen_calendar.tr(),
        image: "assets/images/calendar.png",
        value: AlertValue.schedular);

  void _update(Alert alert) {
    alertNotifierDefaultValue.value = alert.value;
    param = alert;
  }

  Future<void> allDailyNotificationIsCreated(ArgumentNotif argument) async {
    final crypto = argument.crypto;
    final notification = argument.notification;
    final isUpdate = argument.isUpdate;

    // Verify if all daily notif is created
    final allDailyNotif = await sl<NotificationPriceData>()
        .allDailyNotificationIsCreated(crypto.id);

    if (allDailyNotif) {
      alertOptions[alertOptions.length - 1] =
          alertOptions[alertOptions.length - 1].copyWith(disable: true);
      // Default value become option before schedular
      param = alertOptions[2];
    }

    // Get all option notification except schedular
    final tmpAlertOptions = alertOptions
        .where((alert) => alert.value != AlertValue.schedular)
        .toList();

    // If all notification is created, we skip schedular option
    // We want update, initial array is use
    final selectAlertOptions = isUpdate ? alertOptions : tmpAlertOptions;

    // notification exist in order to select AlertValue of this notification
    final notifExist = notification == null;

    // Check if notification exist to activate update process
    if (!notifExist) {
      for (final option in selectAlertOptions) {
        if (notification.typeNotification == option.value) {
          param = option;
        }
      }
    }
    alertNotifierDefaultValue.value = param.value;
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ArgumentNotif;
    final isUpdate = arguments.isUpdate;
    final crypto = arguments.crypto;

    allDailyNotificationIsCreated(arguments);

    return Scaffold(
      appBar:  AppBarWidget(
        title: LocaleKeys.chooseAlertScreen_titleAppBar.tr(args: [crypto.name] ),
        leading: true,
        actions: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: 
           AutoSizeText(
            LocaleKeys.chooseAlertScreen_subtitle.tr(),
            style: TextStyle(fontSize: Media.headline4, fontFamily: FontFamily.montSerrat ),
          )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: alertNotifierDefaultValue,
            builder: (context, defaultAlertValue, child) => ListView.separated(
                padding: const EdgeInsets.all(0),
                itemCount: alertOptions.length,
                separatorBuilder: (context, index) => Divider(
                      height: 0,
                      color: greyLight,
                    ),
                itemBuilder: (context, index) {
                  final alert = alertOptions[index];
                  return CategorieNotificationWidget(
                    disable: alert.disable,
                    key: Key(alert.value.name),
                    radio: defaultAlertValue,
                    update: _update,
                    alert: alert,
                  );
                }),
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ButtonWidget(
              onPressed: () => Navigator.of(context).pushNamed(
                  SetAlertScreen.routeName,
                  arguments: ArgumentsScreen(
                      crypto: crypto,
                      alert: param,
                      isUpdate: isUpdate,
                      notification: arguments.notification)),
              title: LocaleKeys.nextBtn.tr(),
              raduis: 10,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, bottom: 35, top: 10),
            child: ButtonWidget(
              onPressed: () => Navigator.of(context).pop(),
              color: blue1,
              title: LocaleKeys.dismissBtn.tr(),
              raduis: 10,
            ),
          )
        ],
      ),
    );
  }
}

// Contain information to pass to variable
class Param {
  final String title;
  final IconData icon;
  final AlertValue type;
  const Param(
      {required this.title,
      required this.icon,
      this.type = AlertValue.schedular});
}
