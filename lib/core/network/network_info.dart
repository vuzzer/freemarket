import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';

abstract class NetworkInfo {
  static final StreamController<InternetConnectionStatus> internetController =
      StreamController<InternetConnectionStatus>.broadcast();
  Future<bool> get isConnected;
  Stream<InternetConnectionStatus> get listener;
  void checkConnectivity();
  void dispose();
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker connectionChecker;
  // Listener
  StreamSubscription? listen;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  Stream<InternetConnectionStatus> get listener =>
      NetworkInfo.internetController.stream;

  @override
  void checkConnectivity() {
    listen = connectionChecker.onStatusChange.listen((status) {
      Logger().d(status);
      NetworkInfo.internetController.sink.add(status);
    });
  }

  @override
  void dispose() {
    listen?.cancel();
    NetworkInfo.internetController.close();
  }
}

class CheckConnectivity {
  static final StreamController<InternetConnectionStatus> internetController =
      StreamController<InternetConnectionStatus>.broadcast();

  static final InternetConnectionChecker connectionChecker =
      InternetConnectionChecker();

  // Listener
  static StreamSubscription? listen;

  static Future<bool> get isConnected => connectionChecker.hasConnection;

  static Stream<InternetConnectionStatus> get listener =>
      NetworkInfo.internetController.stream;

  static void checkConnectivity() {
    listen = connectionChecker.onStatusChange.listen((status) {
      Logger().d(status);
      NetworkInfo.internetController.sink.add(status);
    });
  }

  static void dispose() {
    listen?.cancel();
    NetworkInfo.internetController.close();
  }
}
