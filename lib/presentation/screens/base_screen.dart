import 'package:defi/core/network/network_info.dart';
import 'package:defi/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
  const BaseScreen(this.child, {super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  void initState() {
    CheckConnectivity.checkConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    CheckConnectivity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: CheckConnectivity.listener,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                Logger().d(snapshot.connectionState);
              }
              final status = snapshot.data;
              if (status == InternetConnectionStatus.connected) {
                return widget.child;
              }
              return Center(
                  child: Text(
                "Pas de connexion internet",
                style: Theme.of(context).textTheme.displayMedium,
              ));
            }));
  }
}
