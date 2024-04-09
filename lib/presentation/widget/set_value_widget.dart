import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/core/utils_process.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:defi/helpers/crypto_symbols.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/blocs/notification-price/notification_price_bloc.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:defi/presentation/screens/set_alert_screen.dart';
import 'package:defi/presentation/widget/adaptive_textform_widget.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/presentation/widget/keyboard_widget.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/font_family.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SetValueWidget extends StatefulWidget {
  final CryptoInfo crypto;
  final Alert alert;
  final NotificationCrypto? notification;
  const SetValueWidget(
      {super.key,
      required this.crypto,
      required this.alert,
      this.notification});

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

  // Notifier to check if price alert is correct
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
      const maxLength = 10;
      if (!regExp.hasMatch(text) || _controller.text.length >= maxLength) {
        _controller.text = text.substring(0, text.length - 1);

        //Change the cursor position
        _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: _controller.text.length));
      }
    }
    // Change value of notifier checker
    checkPriceNotifier.value = _controller.text;
  }

  @override
  void dispose() {
    _controller.dispose();
    focusNotifier.dispose();
    _alertFocus.dispose();
    checkPriceNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CryptoInfo crypto = widget.crypto;
    final Alert alert = widget.alert;
    final updated = widget.notification == null;
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (_alertFocus.hasFocus) {
            _alertFocus.unfocus();
          }
        },
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    AutoSizeText(
                      alert.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AutoSizeText(
                      alert.desc,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 8),
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
                        color: darkMode
                            ? blue1
                            : FontColor.white1.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10)),
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
                  final message =
                      messageCalcul(alert.value, crypto, _controller.text);
                  final error = messageError(alert.value, crypto, value);
                  return Column(
                    children: [
                      AutoSizeText(
                        message,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: FontFamily.montSerrat,
                            fontSize: 8),
                        textAlign: TextAlign.center,
                      ),
                      if (_controller.text.isNotEmpty &&
                          !validateInput(alert.value, crypto, value))
                        AutoSizeText(
                          error,
                          style: TextStyle(
                              color: FontColor.red,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.montSerrat,
                              fontSize: 8),
                          textAlign: TextAlign.center,
                        )
                    ],
                  );
                }),
            const Spacer(),
            ValueListenableBuilder(
                valueListenable: checkPriceNotifier,
                builder: (context, value, child) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: ButtonWidget(
                        disable:
                            validateInput(alert.value, crypto, _controller.text)
                                ? false
                                : true,
                        onPressed: () {
                          final isUpdate = widget.notification == null;
                          if (isUpdate) {
                            final notificationCreate =
                                createNotification(alert.value, crypto, value);

                            // Created Notification
                            context.read<NotificationPriceBloc>().add(
                                CreateNotificationPrice(notificationCreate));
                          } else {
                            final id = widget.notification!.idNotification;

                            final notificationUpdate = updateNotification(
                                alert.value, crypto, value, id);

                            // Update notification
                            context.read<NotificationPriceBloc>().add(
                                UpdateNotificationPrice(notificationUpdate));
                          }

                          Navigator.of(context).popUntil(
                              ModalRoute.withName(CryptoAssetScreen.routeName));
                        },
                        title: updated
                            ? LocaleKeys.alertBtn.tr()
                            : LocaleKeys.updateBtn.tr(),
                        raduis: 10,
                      ),
                    )),
            Container(
              padding: const EdgeInsets.only(
                  left: 30, right: 30, bottom: 35, top: 10),
              child: ButtonWidget(
                onPressed: () => Navigator.of(context).pop(),
                color: blue1,
                title: LocaleKeys.dismissBtn.tr(),
                raduis: 10,
              ),
            ),
            ValueListenableBuilder(
                valueListenable: focusNotifier,
                builder: (context, hasFocus, child) => Visibility(
                    visible: hasFocus,
                    child: Container(
                        padding: const EdgeInsets.only(bottom: 30),
                        decoration: BoxDecoration(
                            color: darkMode
                                ? blue1
                                : FontColor.white1.withOpacity(0.3)),
                        child: KeyBoardWidget(
                          controller: _controller,
                          routeName: SetAlertScreen.routeName,
                          amount: true,
                          onPressed: () {},
                        ))))
          ],
        ));
  }

}
