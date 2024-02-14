import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:flutter/material.dart';

class DisplayNotificationSetup extends StatelessWidget {
  const DisplayNotificationSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AutoSizeText("Alert", style: TextStyle(color: Colors.white)),
        const AutoSizeText(
            "Receive a one-time notification for this stocks when your conditions are mets."),
        Container(
          padding:
              const EdgeInsets.only(left: 30, right: 30, bottom: 35, top: 10),
          child: ButtonWidget(
            onPressed: () => Navigator.of(context).pop(),
            color: blue1,
            title: "Create Alert",
            raduis: 10,
          ),
        )
      ],
    );
  }
}
