import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/arguments_screen.dart';
import 'package:defi/core/cron_expression.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/screens/choose_alert_screen.dart';
import 'package:defi/presentation/widget/custom_bottom_sheet.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/font_family.dart';
import 'package:defi/styles/media_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationCrypto notification;
  final CryptoInfo crypto;
  const NotificationWidget(
      {super.key, required this.notification, required this.crypto});

  // Give information about notification
  String subtitle(NotificationCrypto notification) {
    String message = "";
    switch (notification.typeNotification) {
      case AlertValue.decrease:
        message = LocaleKeys.notification_down
            .tr(args: ['${notification.percent} %']);
        break;
      case AlertValue.increase:
        message =
            LocaleKeys.notification_up.tr(args: ['${notification.percent} %']);
        break;
      case AlertValue.price:
        message = LocaleKeys.notification_priceCrosses.tr();
        break;
      case AlertValue.schedular:
        message = LocaleKeys.notification_scheduled.tr();
        break;
    }
    return message;
  }

  // Indicate value that will trigger a notification
  String target(NotificationCrypto notification) {
    String message = "";
    switch (notification.typeNotification) {
      case AlertValue.decrease:
        message = formatNumber(notification.futurePrice);
        break;
      case AlertValue.increase:
        message = formatNumber(notification.futurePrice);;
        break;
      case AlertValue.price:
        message = formatNumber(notification.futurePrice);;
        break;
      case AlertValue.schedular:
        switch (notification.cron) {
          case CronExpression.morning:
            message = LocaleKeys.setAlertScreen_marketOpen.tr();
            break;
          case CronExpression.night:
            message = LocaleKeys.setAlertScreen_marketClose.tr();
            break;
          case CronExpression.noon:
            message = LocaleKeys.setAlertScreen_midDay.tr();
            break;
        }
        break;
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);
    return Material(
        color: Colors.transparent,
        child: InkWell(
            splashColor: darkMode ? blueLight : FontColor.white1,
            highlightColor: darkMode ? blueLight : FontColor.white1,
            onTap: () {
              Navigator.of(context).pushNamed(ChooseAlertScreen.routeName,
                  arguments: ArgumentNotif(
                      crypto: crypto,
                      notification: notification,
                      isUpdate: true));
            },
            child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    backgroundColor: blue1,
                    radius: 20,
                    backgroundImage: NetworkImage(crypto.image),
                  ),
                ),
                title: AutoSizeText(
                  crypto.name,
                ),
                subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: AutoSizeText(subtitle(notification),
                        style: TextStyle(fontFamily: FontFamily.montSerrat))),
                trailing: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Price prediction
                        AutoSizeText(
                            predictFor(notification.typeNotification,
                                target(notification)),
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontFamily: FontFamily.montSerrat)),
                        //Balance token
                        const SizedBox(
                          height: 8,
                        ),
                        IconButton(
                            onPressed: () {
                              customBottomSheet(
                                  context, notification, crypto, darkMode);
                            },
                            splashRadius: 20,
                            icon: Icon(
                              Icons.more_horiz,
                              color:
                                  darkMode ? FontColor.white : FontColor.black,
                            ))
                      ],
                    )))));
  }

  // Display prediction
  String predictFor(AlertValue alert, String prediction) {
    if (alert == AlertValue.schedular) {
      return truncateText(message: prediction);
    }
    return prediction;
  }

  String truncateText({required String message, int maxLength = 10}) {
    if (SizeScreen.veryExtraSmall) {
      if (message.length <= maxLength) {
        return message;
      }
      return '${message.substring(0, maxLength)}...';
    }
    return message;
  }

  String formatNumber(double number) {
    if (number >= 1000000000) {
      return LocaleKeys.billion.tr(namedArgs: {
        'billion': '\$${(number / 1000000000).toStringAsFixed(1)}'
      });
    } else if (number >= 1000000) {
      return LocaleKeys.million.tr(
          namedArgs: {'million': '\$${(number / 1000000).toStringAsFixed(1)}'});
    } else {
      return '\$${number.toStringAsFixed(2)}';
    }
  }
}
