import 'dart:async';
import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/core/hive_box_name.dart';
import 'package:defi/core/notifications/setup_notification.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class BackgroundService {
  static const notificationEvent = "notification"; // Listen data fetch from UI
  static const backgroundEvent =
      "background"; // Name event that activate background mode for android
  static const foregroundEvent =
      "forground"; // Name event that activate background mode for android
  static final service = FlutterBackgroundService();
  static final configNotification = SetupNotification(AwesomeNotifications());

  static Future<void> initialize() async {
    configNotification.createdStrem();
    await service.configure(
        iosConfiguration: IosConfiguration(
            // auto start service
            autoStart: true,
            onForeground: onStart,
            onBackground: onIosBackground),
        androidConfiguration:
            AndroidConfiguration(onStart: onStart, isForegroundMode: true));
  }

  @pragma('vm:entry-point')
  static void onStart(ServiceInstance instance) async {
    DartPluginRegistrant.ensureInitialized();

    // Initialization of Hive Flutter
    await Hive.initFlutter();
    /* var boxHistoryNotification =
        await Hive.openBox(HiveBoxName.notificationHistoryBox);
    boxHistoryNotification.clear(); */

    // Android configuration
    if (instance is AndroidServiceInstance) {
      instance.setAsForegroundService();
      instance.setAsBackgroundService();
    }

    // Listen to fetch data crypto
    instance.on(notificationEvent).listen((event) async {
      List tokensData = event!['tokens'];
      if (tokensData.isNotEmpty) {
        await createNotificationNotScheduled(tokensData);
      }
    });
  }

  @pragma('vm:entry-point')
  static Future<bool> onIosBackground(ServiceInstance instance) async {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();
    Logger().d('Background activate');

    //TODO1 : create process to verify if notification can be created
    //TODO2 : Create Scheduled notification
    
    // Listen to fetch data crypto
    instance.on(notificationEvent).listen((event) async {
      List tokensData = event!['tokens'];
      if (tokensData.isNotEmpty) {
        await createNotificationNotScheduled(tokensData);
      }
    });

    return true;
  }

  static Future<void> createNotificationNotScheduled(
      List cryptoMarketPrice) async {
    var boxNotification = await Hive.openBox('notificationPriceBox');
    List listNotifications = await boxNotification.get('notifications') ?? [];
    await boxNotification.close();

    // Convert notification to NotificationCrypto
    final notificationEntities = listNotifications
        .map((notif) => NotificationCrypto(
            idNotification: notif["idNotification"],
            cryptoId: notif["cryptoId"],
            percent: notif['percent'],
            typeNotification: AlertValue.values[notif['typeNotification']],
            cron: notif["cron"],
            image: notif["image"],
            futurePrice: notif["futurePrice"]))
        .toList();

    //redistribute notification in two kind
    final notificationNotScheduled = notificationEntities
        .where((notification) =>
            notification.typeNotification != AlertValue.schedular)
        .toList();

    // create notification
    for (var notification in notificationNotScheduled) {
      final cryptoCurrentPrice = cryptoMarketPrice
          .where((crypto) => crypto['id'] == notification.cryptoId)
          .toList()[0];

      // difference of price
      final differencePrice =
          (cryptoCurrentPrice['price'] - notification.futurePrice).abs();

      // creat notification if diff is less 0.2
      if (differencePrice >= 0 && differencePrice < 0.2) {
        final createdThisDay =
            await notificationIsTriggerThisDay(notification.idNotification);
        if (!createdThisDay) {
          // Display notification to screen
          if (await configNotification.awesomeNotifications
              .isNotificationAllowed()) {
            configNotification.createAlertNotificationBasedPrice(notification);
          }

          // Register date of notification create
          await createHistoryNotification(notification.idNotification);
        }
      } else {
        //Logger().d('Notification not created');
      }
    }
  }

  static Future<bool> notificationIsTriggerThisDay(int idNotification) async {
    var boxHistoryNotification =
        await Hive.openBox(HiveBoxName.notificationHistoryBox);
    List history = await boxHistoryNotification.get(idNotification) ?? [];
    await boxHistoryNotification.close();

    if (history.isNotEmpty) {
      // Format date is y/M/d
      final currentDate = DateFormat.yMd().format(DateTime.now());
      final lastNotificationDate =
          DateFormat.yMd().format(history.last['date']);
      return currentDate == lastNotificationDate;
    }
    return false;
  }

  static Future<void> createHistoryNotification(int idNotification) async {
    var boxHistoryNotification =
        await Hive.openBox(HiveBoxName.notificationHistoryBox);
    List history = await boxHistoryNotification.get(idNotification) ?? [];

    // insert to box
    boxHistoryNotification.put(idNotification, history);

    //Update Notification trigger not read
    int numberActiveNotification = 0;
    for (var history in boxHistoryNotification.values) {
      for (var logs in history) {
        if (!logs['open']) {
          numberActiveNotification += 1;
        }
      }
    }
    var boxCountNotificationBox =
        await Hive.openBox(HiveBoxName.countNotificationBox);
    boxCountNotificationBox.put('activeNotification', numberActiveNotification);

    await boxHistoryNotification.close();
  }
}
