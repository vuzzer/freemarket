import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/arguments_screen.dart';
import 'package:defi/core/crontab.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/presentation/screens/choose_alert_screen.dart';
import 'package:defi/presentation/widget/custom_bottom_sheet.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter/material.dart';

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
          case CronTabStock.morning:
            message = 'Market Open';
            break;
          case CronTabStock.night:
            message = 'Market close';
            break;
          case CronTabStock.noon:
            message = 'Mid-day';
            break;
        }
        break;
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            splashColor: blueLight,
            highlightColor: blueLight,
            onTap: () {
              Navigator.of(context).pushNamed(ChooseAlertScreen.routeName,
                  arguments: ArgumentNotif(
                      crypto: crypto, notification: notification));
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
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: AutoSizeText(subtitle(notification),
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: FontFamily.montSerrat))),
                trailing: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //price of token on the market (use chainlink)
                        AutoSizeText(target(notification),
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: FontFamily.montSerrat)),
                        //Balance token
                        const SizedBox(
                          height: 8,
                        ),
                        IconButton(
                            onPressed: () {
                              customBottomSheet(context,
                                  notification.idNotification, crypto.id);
                            },
                            splashRadius: 20,
                            icon: const Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            ))
                      ],
                    )))));
  }
}
