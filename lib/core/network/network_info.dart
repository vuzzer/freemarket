import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<InternetConnectionStatus> get listener;
  Future<void> get dispose;
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  Stream<InternetConnectionStatus> get listener =>
      connectionChecker.onStatusChange;


  @override
  Future<void> get dispose => throw UnimplementedError();
}
