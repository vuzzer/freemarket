import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/core/arguments_screen.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/core/notifications/alert_notification.dart';
import 'package:defi/presentation/widget/adaptive_textform_widget.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/presentation/widget/keyboard_widget.dart';
import 'package:defi/presentation/widget/schedule_widget.dart';
import 'package:defi/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../helpers/crypto_symbols.dart';
import 'crypto_asset_screen.dart';

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
  late TextEditingController _controller;
  final FocusNode _alertFocus = FocusNode();

  final ValueNotifier<bool> focusNotificier =
      ValueNotifier<bool>(false); // Check if field amount has focus
  @override
  void initState() {
    _controller = TextEditingController();
    _alertFocus.addListener(() {
      focusNotificier.value = _alertFocus.hasFocus;
    });

    // Stream notification created
    sl<AlertNotification>().createdStrem();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    focusNotificier.dispose();
    _alertFocus.removeListener(() {});
    _alertFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ArgumentsScreen;
    final crypto = arguments.crypto; // Crypto argument
    final alert = arguments.alert; // Alert argument

    final alertBasedPrice = Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const AutoSizeText(
                  "Enter a percentage amount",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 8,
                ),
                AutoSizeText(
                  alert.desc,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 8),
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        Center(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: (kSizeUnit * 3).w,
                height: 50,
                decoration: BoxDecoration(
                    color: blue1, borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Form(
                  child: AdapativeTextFormWidget(
                    alert: alert,
                    controller: _controller,
                    alertFocus: _alertFocus,
                  ),
                )))),
        const SizedBox(
          height: 8,
        ),
        const AutoSizeText(
          "Alert will remain active until your target price is reached.",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 8),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ButtonWidget(
            onPressed: () {
              // Created Notification
              sl<AlertNotification>()
                  .createAlertNotificationBasedPrice(crypto, 20.0);

              Navigator.of(context).popUntil( ModalRoute.withName(CryptoAssetScreen.routeName) );
            },
            title: "Create alert",
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
        ),
        ValueListenableBuilder(
            valueListenable: focusNotificier,
            builder: (context, hasFocus, child) => Visibility(
                visible: hasFocus,
                child: Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    decoration: const BoxDecoration(color: blue1),
                    child: KeyBoardWidget(
                      controller: _controller,
                      routeName: SetAlertScreen.routeName,
                      amount: true,
                      onPressed: () {},
                    )))),
      ],
    );

    return Scaffold(
        appBar: const AppBarWidget(
          title: "Price Alert",
          leading: true,
        ),
        body: alert.value == AlertValue.schedular
            ? const ScheduleWidget()
            : alertBasedPrice);
  }
}
