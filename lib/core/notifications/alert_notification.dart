import 'dart:io';
import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:flutter/material.dart';

class AlertNotification {
  static String channelKeyPrice = "Event Price";
  static String channelKeyScheduled = "Event Scheduled";
  static String channelName = "Price Alert";
  final AwesomeNotifications awesomeNotifications;

  AlertNotification(this.awesomeNotifications);

  Future<void> initialize() async {
    await awesomeNotifications.initialize(
      'resource://drawable/res_free',
      [
        NotificationChannel(
            channelKey: channelKeyPrice,
            channelName: channelName,
            channelDescription: "Notification channel for price of token",
            importance: NotificationImportance.High,
            channelShowBadge:
                Platform.isIOS ? true : false, // display badge on IOS
            defaultColor: darkBlue,
            ledColor: Colors.white),
        NotificationChannel(
            channelKey: channelKeyScheduled,
            channelName: "Price Scheduled",
            channelDescription:
                "Notification channel for price of token (Scheduled)",
            importance: NotificationImportance.High,
            channelShowBadge:
                Platform.isIOS ? true : false, // display badge on IOS
            defaultColor: darkBlue,
            ledColor: Colors.white),
      ],
      debug: true,
    );
  }

  Future<bool> permissionNotification() {
    return awesomeNotifications.isNotificationAllowed();
  }

  // Creation of alert based price of token
  Future<void> createAlertNotificationBasedPrice(CryptoInfo crypto) async {
    int random = Random().nextInt(1 << 10);
    int milliseconds = DateTime.now().millisecondsSinceEpoch;
    int idNotification = (milliseconds & 0x3FF) << 10 | random;
    await awesomeNotifications.createNotification(
        content: NotificationContent(
            id: idNotification,
            channelKey: channelKeyPrice,
            color: blue,
            title: "Bitcoin prix",
            body: "Le prix du bitcoin a grimpé de 10%",
            bigPicture:
                "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1696501628",
            notificationLayout: NotificationLayout.BigPicture));
  }

  // Create alert scheduled
  Future<void> createAlertNotificationScheduled(CryptoInfo crypto) async {
    int random = Random().nextInt(1 << 10);
    int milliseconds = DateTime.now().millisecondsSinceEpoch;
    int idNotification = (milliseconds & 0x3FF) << 10 | random;
    await awesomeNotifications.createNotification(
        content: NotificationContent(
            id: idNotification,
            channelKey: channelKeyScheduled,
            color: blue,
            title: "Bitcoin prix",
            body: "Le prix du bitcoin a grimpé de 10%",
            bigPicture:
                "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1696501628",
            notificationLayout: NotificationLayout.BigPicture));
  }

  // Create to capture user action and notification created
  Future<void> createdStrem() async {
    awesomeNotifications.setListeners(
        onNotificationCreatedMethod: onNotificationCreatedMethod,
        onActionReceivedMethod: onActionReceivedMethod );
  }

  Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
        
      }
  Future<void> onActionReceivedMethod(
      ReceivedNotification receivedNotification) async {
        awesomeNotifications.getGlobalBadgeCounter().then((value) =>{
          awesomeNotifications.setGlobalBadgeCounter(value -1)
        } );
      }
}
