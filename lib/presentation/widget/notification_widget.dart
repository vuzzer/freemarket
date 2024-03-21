import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/arguments_screen.dart';
import 'package:defi/core/cron_expression.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/screens/choose_alert_screen.dart';
import 'package:defi/presentation/widget/custom_bottom_sheet.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/font_family.dart';
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
        message = 'Down ${notification.percent} %';
        break;
      case AlertValue.increase:
        message = 'Up ${notification.percent} %';
        break;
      case AlertValue.price:
        message = 'Price crosses';
        break;
      case AlertValue.schedular:
        message = 'Every day at';
        break;
    }
    return message;
  }

  // Indicate value that will trigger a notification
  String target(NotificationCrypto notification) {
    String message = "";
    switch (notification.typeNotification) {
      case AlertValue.decrease:
        message = '\$${notification.futurePrice.toStringAsFixed(2)}';
        break;
      case AlertValue.increase:
        message = '\$${notification.futurePrice.toStringAsFixed(2)}';
        break;
      case AlertValue.price:
        message = '\$${notification.futurePrice.toStringAsFixed(2)}';
        break;
      case AlertValue.schedular:
        switch (notification.cron) {
          case CronExpression.morning:
            message = 'Market Open';
            break;
          case CronExpression.night:
            message = 'Market close';
            break;
          case CronExpression.noon:
            message = 'Mid-day';
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
                        //price of token on the market (use chainlink)
                        AutoSizeText(target(notification),
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
}
