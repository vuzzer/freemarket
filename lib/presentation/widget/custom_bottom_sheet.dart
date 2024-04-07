import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/arguments_screen.dart';
import 'package:defi/core/cron_expression.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/presentation/blocs/notification-price/notification_price_bloc.dart';
import 'package:defi/presentation/screens/choose_alert_screen.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customBottomSheet(BuildContext context, NotificationCrypto notification,
    CryptoInfo crypto, bool darkMode) {
  final size = ScreenUtil();

  showModalBottomSheet(
    context: context,
    elevation: 2,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(30), right: Radius.circular(30))),
    builder: (context) => Container(
      width: size.screenWidth,
      height: 200,
      decoration: BoxDecoration(
          color: darkMode ? blue1 : FontColor.white,
          borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(30), right: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 35,
              ),
              Expanded(
                  child: Center(
                      child: AutoSizeText(
                titleCustom(notification),
                style: TextStyle(
                    fontFamily: FontFamily.montSerrat,
                    fontWeight: FontWeight.bold),
              ))),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.close,
                  ))
            ],
          ),
          Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: blueLight,
                  highlightColor: blueLight,
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(ChooseAlertScreen.routeName,
                        arguments: ArgumentNotif(
                            crypto: crypto, notification: notification));
                  },
                  child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 15, right: 5),
                      title: AutoSizeText(
                        'Update',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.montSerrat,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pushNamed(
                                    ChooseAlertScreen.routeName,
                                    arguments: ArgumentNotif(
                                        crypto: crypto,
                                        notification: notification));
                              },
                              splashRadius: 20,
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                color: darkMode
                                    ? FontColor.white
                                    : FontColor.black,
                              ))
                        ],
                      )))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: greyLight,
              )),
          Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: blueLight,
                  highlightColor: blueLight,
                  onTap: () {
                    // delete notification
                    sl<NotificationPriceBloc>().add(DeleteNotificationPrice(
                        crypto.id, notification.idNotification));
                    // Close bottomSheet
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 15, right: 5),
                      title: AutoSizeText(
                        'Delete Alert',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: FontFamily.montSerrat,
                          color: FontColor.red,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                // delete notification
                                sl<NotificationPriceBloc>().add(
                                    DeleteNotificationPrice(crypto.id,
                                        notification.idNotification));
                                // Close bottomSheet
                                Navigator.of(context).pop();
                              },
                              splashRadius: 20,
                              icon: const Icon(
                                Icons.delete_forever_outlined,
                                color: FontColor.red,
                              ))
                        ],
                      ))))
        ],
      ),
    ),
  );
}

String titleCustom(NotificationCrypto notification) {
  if (notification.typeNotification == AlertValue.schedular) {
    switch (notification.cron) {
      case CronExpression.morning:
        return 'Market Open';
      case CronExpression.noon:
        return 'Mid-day';
      default:
        return 'Market close';
    }
  }
  return 'Target price ${notification.futurePrice.toStringAsFixed(2)}';
}
