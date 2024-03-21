import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/arguments_screen.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/presentation/blocs/notification-price/notification_price_bloc.dart';
import 'package:defi/presentation/screens/choose_alert_screen.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/presentation/widget/notification_widget.dart';
import 'package:defi/styles/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DisplayNotificationSetup extends StatelessWidget {
  final CryptoInfo crypto;
  const DisplayNotificationSetup({super.key, required this.crypto});

  @override
  Widget build(BuildContext context) {
    // Brightness
    context.read<NotificationPriceBloc>().add(GetNotificationPrice(crypto.id));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        AutoSizeText("Alert",
            style: TextStyle(
              color: Colors.white,
              fontSize: FontSize.large,
              fontWeight: FontWeight.bold,
            )),
        const SizedBox(
          height: 8,
        ),
        BlocBuilder<NotificationPriceBloc, NotificationPriceState>(
                builder: (context, state) {
              if (state.notifications.isNotEmpty) {
                // List of notification setup
                return Column(
                  children: [
                    ...state.notifications
                        .map((notification) => NotificationWidget(
                              notification: notification,
                              crypto: crypto,
                            ))
                        .toList()
                  ],
                );
              }
              return const AutoSizeText(
                  "Receive a one-time notification for this stocks when your conditions are mets.");
            }),
        Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 35, top: 10),
          child: ButtonWidget(
            onPressed: () => Navigator.of(context).pushNamed(
                ChooseAlertScreen.routeName,
                arguments: ArgumentNotif(crypto: crypto)),
            color: blue1,
            title: "Create Alert",
            raduis: 10,
          ),
        )
      ],
    );
  }
}
