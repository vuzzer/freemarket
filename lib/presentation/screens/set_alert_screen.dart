import 'package:defi/core/arguments_screen.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/schedule_widget.dart';
import 'package:defi/presentation/widget/set_value_widget.dart';
import 'package:flutter/material.dart';

class SetAlertScreen extends StatefulWidget {
  static const routeName = "/set-amount";
  final bool scheduled;
  const SetAlertScreen({
    Key? key,
    this.scheduled = false,
  }) : super(key: key);

  @override
  State<SetAlertScreen> createState() => _SetAlertScreenState();
}

class _SetAlertScreenState extends State<SetAlertScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ArgumentsScreen;
    final crypto = arguments.crypto; // Crypto argument
    final alert = arguments.alert; // Alert argument

    return Scaffold(
        appBar: const AppBarWidget(
        
          title: "Price Alert",
          leading: true,
        ),
        body: alert.value == AlertValue.schedular
            ? const ScheduleWidget()
            : SetValueWidget(
                alert: alert,
                crypto: crypto,
              ));
  }
}
