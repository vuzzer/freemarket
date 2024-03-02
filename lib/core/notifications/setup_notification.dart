import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/create_unique_id.dart';
import 'package:defi/core/notifications/notification_controller.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:flutter/material.dart';

const priceType = "price";
const percent_type = "percent";
const scheduled_type = "scheduled";

class SetupNotification {
  static String channelKeyPrice = "Event Price";
  static String channelKeyScheduled = "Event Scheduled";
  static String channelName = "Price Alert";
  final AwesomeNotifications awesomeNotifications;

  SetupNotification(this.awesomeNotifications);

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
  Future<void> createAlertNotificationBasedPrice(
      NotificationCrypto notification) async {
    final id = createUniqueId();
    await awesomeNotifications.createNotification(
        content: NotificationContent(
            id: id,
            channelKey: channelKeyPrice,
            color: blue,
            title: "${notification.cryptoId} prix",
            body: "Le prix du ${notification.cryptoId} a grimpé de 10%",
            payload: {
              "typeNotif": priceType,
              "cryptoId": notification.cryptoId,
              "id": id.toString(),
              "price": notification.futurePrice.toString()
            },
            bigPicture: notification.image,
            notificationLayout: NotificationLayout.BigPicture));
  }

    // Creation of alert based price of token
  Future<void> test() async {
    final id = createUniqueId();
    await awesomeNotifications.createNotification(
        content: NotificationContent(
            id: id,
            channelKey: channelKeyPrice,
            color: blue,
            title: "Bitcoin prix",
            body: "Le prix du 1000 a grimpé de 10%",
            notificationLayout: NotificationLayout.BigPicture));
  }

  // Create alert scheduled
  Future<void> createAlertNotificationScheduled(CryptoInfo crypto) async {

    await awesomeNotifications.createNotification(
      content: NotificationContent(
          id: createUniqueId(),
          channelKey: channelKeyScheduled,
          color: blue,
          title: "Bitcoin prix",
          body: "Le prix du bitcoin a grimpé de 10%",
          payload: {"typeNotif": scheduled_type},
          bigPicture:
              "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1696501628",
          notificationLayout: NotificationLayout.BigPicture),
    );
  }

  // Create to capture user action and notification created
  Future<void> createdStrem() async {
    awesomeNotifications.setListeners(
        onNotificationCreatedMethod: NotificationController.onNotificationCreatedMethod,
        onActionReceivedMethod: onActionReceivedMethod);
  }

  // Callback when notification is created
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {

  }
  
  static Future<void> onActionReceivedMethod(
      ReceivedNotification receivedNotification) async {
    if (Platform.isIOS) {
      AwesomeNotifications().getGlobalBadgeCounter().then(
          (value) => {AwesomeNotifications().setGlobalBadgeCounter(value - 1)});
    }
  }

  void dispose() {
    awesomeNotifications.dispose();
  }
}