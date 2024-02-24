import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/arguments_screen.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/data/datasource/notification/notification_price_data.dart';
import 'package:defi/presentation/screens/set_alert_screen.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/presentation/widget/categorie_notification_widget.dart';
import 'package:defi/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ChooseAlertScreen extends StatefulWidget {
  static const routeName = "/choose-currency";

  const ChooseAlertScreen({Key? key}) : super(key: key);

  @override
  State<ChooseAlertScreen> createState() => _ChooseAlertScreenState();
}

class _ChooseAlertScreenState extends State<ChooseAlertScreen> {
  // ValueNotifier : listen to change of option

  final ValueNotifier<AlertValue> alertNotifierDefaultValue =
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
      title: "Calendar",
      desc: "You'll be notified when the daily price increase",
      image: "assets/images/calendar.png",
      value: AlertValue.schedular);

  void _update(Alert alert) {
    alertNotifierDefaultValue.value = alert.value;
    param = alert;
  }

  Future<void> allDailyNotificationIsCreated(ArgumentNotif argument) async {
    final crypto = argument.crypto;
    final notification = argument.notification;
    final isUpdate = argument.isUpdate;


      // Verify if all daily notif is created
      final allDailyNotif = await sl<NotificationPriceData>()
          .allDailyNotificationIsCreated(crypto.id);

      if (allDailyNotif) {
        alertOptions[alertOptions.length - 1] =
            alertOptions[alertOptions.length - 1].copyWith(disable: true);
        // Default value become option before schedular
        param = alertOptions[2];
      }

      // Get all option notification except schedular
      final tmpAlertOptions = alertOptions
          .where((alert) => alert.value != AlertValue.schedular)
          .toList();

      // If all notification is created, we skip schedular option
      // We want update, initial array is use
      final selectAlertOptions = isUpdate ? alertOptions  : tmpAlertOptions;

      // notification exist in order to select AlertValue of this notification
      final notifExist = notification == null;

      // Check if notification exist to activate update process
      if (!notifExist) {
        for (final option in selectAlertOptions) {
          if (notification.typeNotification == option.value) {
            param = option;
          }
        }
      }
      alertNotifierDefaultValue.value = param.value;
    
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as ArgumentNotif;
    final crypto = arguments.crypto;

    allDailyNotificationIsCreated(arguments);

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
            valueListenable: alertNotifierDefaultValue,
            builder: (context, defaultAlertValue, child) => ListView.separated(
                padding: const EdgeInsets.all(0),
                itemCount: alertOptions.length,
                separatorBuilder: (context, index) => Divider(
                      height: 0,
                      color: greyLight,
                    ),
                itemBuilder: (context, index) {
                  final alert = alertOptions[index];
                  return CategorieNotificationWidget(
                    disable: alert.disable,
                    key: Key(alert.value.name),
                    radio: defaultAlertValue,
                    update: _update,
                    alert: alert,
                  );
                }),
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ButtonWidget(
              onPressed: () => Navigator.of(context).pushNamed(
                  SetAlertScreen.routeName,
                  arguments: ArgumentsScreen(
                      crypto: crypto,
                      alert: param,
                      notification: arguments.notification)),
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
