import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UserProvider extends ChangeNotifier {
  User? user;
  //UserProvider({required this.user});
  User? get getUser => user;

  void setUser(User? data) {
    user = data;
    //Logger().d(user);
    notifyListeners();
  }
}
