import 'dart:async';
import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:defi/core/background/background_task.dart';
import 'package:defi/core/hive_box_name.dart';
import 'package:defi/core/notifications/setup_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

class BackgroundService {
  // Listen data fetch from UI
  static const notificationEvent = "notification"; 

  // Name event that activate background mode for android
  static const backgroundEvent ="background"; 

  // Name event that activate background mode for android
  static const foregroundEvent ="forground"; 

  static final service = FlutterBackgroundService();

  static final configNotification = SetupNotification(AwesomeNotifications());

  static Future<void> initialize() async {
    // listen notification actions
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

  // Foreground task runner Ios|Android
  @pragma('vm:entry-point')
  static void onStart(ServiceInstance instance) async {
    DartPluginRegistrant.ensureInitialized();

    // Initialization of Hive Flutter
    await Hive.initFlutter();

    // Android configuration
    if (instance is AndroidServiceInstance) {
      instance.setAsForegroundService();
      instance.setAsBackgroundService();
    }

    // Listen to fetch data crypto
    instance.on(notificationEvent).listen((event) async {
      List tokensData = event!['tokens'];
      if (tokensData.isNotEmpty) {
        await BackgroundTask.createNotificationNotScheduled(tokensData, instance);
      }
      // get number of notification to send to UI
      var boxCountNotificationBox =
          await Hive.openBox(HiveBoxName.countNotificationBox);
      int numberActiveNotification =
          boxCountNotificationBox.get('activeNotification') ?? 0;
      instance.invoke('count', {'count': numberActiveNotification});
    });
  }

  // Background runner for ios
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
        await BackgroundTask.createNotificationNotScheduled(tokensData, instance);
      }
    });
    return true;
  }

}
