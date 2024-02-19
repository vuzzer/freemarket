import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/create_unique_id.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/helpers/crypto_symbols.dart';
import 'package:defi/presentation/blocs/notification-price/notification_price_bloc.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:defi/presentation/screens/set_alert_screen.dart';
import 'package:defi/presentation/widget/adaptive_textform_widget.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/presentation/widget/keyboard_widget.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class SetValueWidget extends StatefulWidget {
  final CryptoInfo crypto;
  final Alert alert;
  const SetValueWidget({super.key, required this.crypto, required this.alert});

  @override
  State<SetValueWidget> createState() => _SetValueWidgetState();
}

class _SetValueWidgetState extends State<SetValueWidget> {
  late TextEditingController _controller;
  final FocusNode _alertFocus = FocusNode();

  // Unique id for form
  final _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> focusNotifier =
      ValueNotifier<bool>(false); // Check if field amount has focus

  // Notifier to check price
  final ValueNotifier<String> checkPriceNotifier = ValueNotifier<String>("");

  @override
  void initState() {
    _controller = TextEditingController();
    _alertFocus.addListener(() {
      focusNotifier.value = _alertFocus.hasFocus;
    });

    _controller.addListener(onChanged);

    super.initState();
  }

  // Called when value of text controller change
  void onChanged() {
    final text = _controller.text;
    final RegExp regExp = RegExp(r'^[1-9](\d)*(\.((\d){1,2})?)?$');

    // Check if text controller is not empty
    if (text.isNotEmpty) {
      if (!regExp.hasMatch(text)) {
        _controller.text = text.substring(0, text.length - 1);

        //Change the cursor position
        _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: _controller.text.length));
      }
    }
    // Change value of notifier checker
    checkPriceNotifier.value = _controller.text;
  }

  bool validateInput(AlertValue typeAlert, CryptoInfo crypto) {
    double constant =
        500000; // Constant use to calculate the max price of crypto

    double predictionMaxPrice = (2 * crypto.currentPrice! + constant);

    bool success = false;

    if (_controller.text.isNotEmpty) {
      switch (typeAlert) {
        case AlertValue.price:
          final price = double.parse(_controller.text);
          success = price < predictionMaxPrice;
          break;
        case AlertValue.decrease:
          // If percent precise a price that is low
          // of current price, it's true otherwise it's false
          // future price that doesn't exceed currentPrice
          final percent = double.parse(_controller.text);
          success =
              crypto.currentPrice! > (crypto.currentPrice! * (percent / 100));
          break;
        case AlertValue.increase:
          final percent = double.parse(_controller.text);
          success =
              (crypto.currentPrice! * (percent / 100)) < predictionMaxPrice;
          break;
        case AlertValue.schedular:
          break;
      }
    }

    return success;
  }

  @override
  void dispose() {
    _controller.dispose();
    focusNotifier.dispose();
    _alertFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CryptoInfo crypto = widget.crypto;
    final Alert alert = widget.alert;
    return Column(
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
                  key: _formKey,
                  child: AdapativeTextFormWidget(
                    alert: alert,
                    controller: _controller,
                    alertFocus: _alertFocus,
                  ),
                )))),
        const SizedBox(
          height: 8,
        ),
        ValueListenableBuilder(
            valueListenable: checkPriceNotifier,
            builder: (context, value, child) {
              final date = DateFormat.Hm().format(DateTime.now());
              return AutoSizeText(
                "Last update price: \$${crypto.currentPrice} of $date",
                style:  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: FontFamily.montSerrat,
                    fontSize: 8),
              );
            }),
        const Spacer(),
        ValueListenableBuilder(
            valueListenable: checkPriceNotifier,
            builder: (context, value, child) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ButtonWidget(
                    disable: validateInput(alert.value, crypto) ? false : true,
                    onPressed: () {
                      final notification = NotificationCrypto(
                          idNotification: createUniqueId(),
                          cryptoId: crypto.id,
                          typeNotification: alert.value);

                      // Created Notification
                      context
                          .read<NotificationPriceBloc>()
                          .add(CreateNotificationPrice(notification));

                      Navigator.of(context).popUntil(
                          ModalRoute.withName(CryptoAssetScreen.routeName));
                    },
                    title: "Create alert",
                    raduis: 10,
                  ),
                )),
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
            valueListenable: focusNotifier,
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
                    ))))
      ],
    );
  }
}
