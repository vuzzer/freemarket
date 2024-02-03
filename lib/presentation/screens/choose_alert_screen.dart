import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/alert.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/presentation/screens/set_alert_screen.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/presentation/widget/alert_widget.dart';
import 'package:flutter/material.dart';

class ChooseAlertScreen extends StatefulWidget {
  static const routeName = "/choose-currency";

  const ChooseAlertScreen({Key? key}) : super(key: key);

  @override
  State<ChooseAlertScreen> createState() => _ChooseAlertScreenState();
}

class _ChooseAlertScreenState extends State<ChooseAlertScreen> {
  // ValueNotifier : listen to change of option
  final ValueNotifier<AlertValue> alertNotifier =
      ValueNotifier<AlertValue>(AlertValue.schedular);

  //Definition of alert options
  List<Alert> alertOptions = [
    const Alert(
        title: "Price",
        desc: "You'll be notified when the daily price increase",
        image: "assets/images/price.png",
        icon: Icons.attach_money,
        value: AlertValue.price),
    const Alert(
        title: "Percentage increase",
        desc: "You'll be notified when the daily price increase",
        image: "assets/images/increase.png",
        icon: Icons.add,
        value: AlertValue.increase),
    const Alert(
        title: "Percentage decrease",
        desc: "You'll be notified when the daily price increase",
        image: "assets/images/decrease.png",
        icon: Icons.remove,
        value: AlertValue.decrease),
    const Alert(
        title: "Calendar",
        desc: "You'll be notified when the daily price increase",
        image: "assets/images/calendar.png",
        value: AlertValue.schedular),
  ];

  //Parameters for set_alert_screen
  Alert param = const Alert(
      title: "Price",
      desc: "You'll be notified when the daily price increase",
      image: "assets/images/price.png",
      icon: Icons.attach_money,
      value: AlertValue.price);

  void _update(Alert alert) {
    alertNotifier.value = alert.value;
    param = alert;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Set an alert for bitcoin",
        leading: true,
        actions: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const AutoSizeText(
            "Receive AlertValues for price changes and more",
            style: TextStyle(color: Colors.white, fontSize: 8),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ValueListenableBuilder(
            valueListenable: alertNotifier,
            builder: (context, defaultAlertValue, child) => ListView.separated(
                padding: const EdgeInsets.all(0),
                itemCount: alertOptions.length,
                separatorBuilder: (context, index) => Divider(
                      height: 0,
                      color: greyLight,
                    ),
                itemBuilder: (context, index) {
                  final alert = alertOptions[index];
                  return AlertWidget(
                    radio: defaultAlertValue,
                    update: _update,
                    alert: alert,
                  );
                }),
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ButtonWidget(
              onPressed: () =>
                  Navigator.of(context).pushNamed(SetAlertScreen.routeName, arguments: {param} ),
              title: "Next",
              raduis: 10,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, bottom: 35, top: 10),
            child: ButtonWidget(
              onPressed: () => Navigator.of(context).pop(),
              color: blue1,
              title: "Dismiss",
              raduis: 10,
            ),
          )
        ],
      ),
    );
  }
}

// Contain information to pass to variable
class Param {
  final String title;
  final IconData icon;
  final AlertValue type;
  const Param(
      {required this.title,
      required this.icon,
      this.type = AlertValue.schedular});
}
