import 'package:defi/core/network/network_info.dart';
import 'package:defi/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkProvider extends ChangeNotifier {
  Stream<InternetConnectionStatus> network = sl<NetworkInfo>().listener;
  Stream<InternetConnectionStatus> get checkInternet => network;
}
