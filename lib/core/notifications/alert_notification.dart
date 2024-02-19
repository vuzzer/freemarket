import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/create_unique_id.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/presentation/blocs/notification-price/notification_price_bloc.dart';
import 'package:defi/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

const priceType = "price";
const percent_type = "percent";
const scheduled_type = "scheduled";

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
  Future<void> createAlertNotificationBasedPrice(
      CryptoInfo crypto, double price) async {
    final id = createUniqueId();
    await awesomeNotifications.createNotification(
        content: NotificationContent(
            id: id,
            channelKey: channelKeyPrice,
            color: blue,
            title: "${crypto.name} prix",
            body: "Le prix du ${crypto.name} a grimpé de 10%",
            payload: {
              "typeNotif": priceType,
              "cryptoId": crypto.id,
              "id": id.toString(),
              "price": price.toString()
            },
            bigPicture: crypto.image,
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
        onNotificationCreatedMethod: onNotificationCreatedMethod,
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


class NotificationController {
    /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future <void> onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future <void> onNotificationDisplayedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future <void> onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future <void> onActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code goes here

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
/*     MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil('/notification-page',
            (route) => (route.settings.name != '/notification-page') || route.isFirst,
        arguments: receivedAction); */
  }
}