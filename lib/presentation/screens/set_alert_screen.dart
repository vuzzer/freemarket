import 'package:defi/core/arguments_screen.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/schedule_widget.dart';
import 'package:defi/presentation/widget/set_value_widget.dart';
import 'package:defi/presentation/widget/set_value_xm_widget.dart';
import 'package:defi/styles/media_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SetAlertScreen extends StatefulWidget {
  static const routeName = "/set-amount";
  final bool scheduled;
  const SetAlertScreen({
    super.key,
    this.scheduled = false,
  });

  @override
  State<SetAlertScreen> createState() => _SetAlertScreenState();
}

class _SetAlertScreenState extends State<SetAlertScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ArgumentsScreen;
    final isUpdate = arguments.isUpdate;
    final crypto = arguments.crypto; // Crypto argument
    final alert = arguments.alert; // Alert argument
    final notification = arguments.notification; // Notification possible null

    return Scaffold(
        appBar: AppBarWidget(
          title: LocaleKeys.setAlertScreen_titleAppBar.tr(),
          leading: true,
        ),
        body: alert.value == AlertValue.schedular
            ? ScheduleWidget(alert: alert, crypto: crypto, isUpdate: isUpdate)
            : setValueWidget(
                alert,
                crypto,
                notification,
              ));
  }

  Widget setValueWidget( alert, CryptoInfo crypto, NotificationCrypto? notification) {
    if (SizeScreen.veryExtraSmall) {
      return SetValueXMWidget(
        alert: alert,
        crypto: crypto,
        notification: notification,
      );
    }
    return SetValueWidget(
      alert: alert,
      crypto: crypto,
      notification: notification,
    );
  }
}
