import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/helpers/enum.dart';
import 'package:flutter/material.dart';



class NetworkProvider extends ChangeNotifier {
  Blockchain network = Blockchain.initial;
  Blockchain get getNetwork => network;
  void setNetwork(Blockchain network) {
    network = network;
    notifyListeners();
  }
}
