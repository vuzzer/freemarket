import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> adaptiveDialog(BuildContext context) async {
  Platform.isIOS
      ? showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
                title: Text(LocaleKeys.permissionNotification_title.tr() ),
                content:
                    Text(LocaleKeys.permissionNotification_body.tr()),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () => Navigator.pop(context),
                    child:  Text(
                      LocaleKeys.permissionNotification_disallow.tr(),
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                  CupertinoDialogAction(
                    onPressed: () {
                      AwesomeNotifications()
                          .requestPermissionToSendNotifications()
                          .then((value) {
                      });
                       Navigator.pop(context);
                    },
                    child:  Text(
                      LocaleKeys.permissionNotification_allow.tr(),
                      style: const TextStyle(
                        color: blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ))
      : showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Allow Notifications'),
            content: const Text('Our app would like to send you notifications'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Don\'t Allow',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () => AwesomeNotifications()
                    .requestPermissionToSendNotifications()
                    .then((_) => Navigator.pop(context)),
                child: const Text(
                  'Allow',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
}
