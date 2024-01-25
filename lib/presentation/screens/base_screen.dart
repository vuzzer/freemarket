import 'package:defi/core/network/network_info.dart';
import 'package:defi/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  const BaseScreen(this.child, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: sl<NetworkInfo>().listener,
            builder: (context, snapshot) {
              var status = snapshot.data;
              if ((status == InternetConnectionStatus.connected)) {
                return WillPopScope(
                  onWillPop: () async {
                    // Check if there is a previous route in the Navigator stack
                    if (Navigator.of(context).canPop()) {
                      // Pop the current route (screen)
                      Navigator.of(context).pop();
                      // Indicate that the back button press has been handled
                      return false;
                    }
                    // If there is no previous route, allow the app to be closed
                    return true;
                  },
                  child: child,
                );
              }

              return Center(
                  child: Text(
                "Pas de connexion internet",
                style: Theme.of(context).textTheme.displayMedium,
              ));
            }));
  }
}
