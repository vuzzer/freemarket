import 'dart:async';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:defi/core/notifications/setup_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
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

    //TODO : verify notification creation in a time period

    // Android configuration
    if (instance is AndroidServiceInstance) {
      instance.setAsForegroundService();
      instance.setAsBackgroundService();
    }

    // Listen to fetch data crypto
    instance.on(notificationEvent).listen((event) {});
  }

  @pragma('vm:entry-point')
  static Future<bool> onIosBackground(ServiceInstance service) async {
    WidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();
    Logger().d('Background activate');

    //SetupNotification( AwesomeNotifications() ).test();
    // Periodic check
    SetupNotification(AwesomeNotifications()).test();

    return true;
  }
}
