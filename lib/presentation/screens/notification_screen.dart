import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/core/notifications/notification_message.dart';
import 'package:defi/presentation/blocs/notification-triggered/notification_triggered_bloc.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/loading_widget.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  static const routeName = "/notification";
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    // Get all notification
    sl<NotificationTriggeredBloc>()
        .add(const NotificationTriggeredEvent.getAll());
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Mes Notifications",
        leading: true,
      ),
      body: SafeArea(child:
          BlocBuilder<NotificationTriggeredBloc, NotificationTriggeredState>(
              builder: (context, state) {
        if (state.loading) {
          return const LoadingWidget();
        }
        if (state.all.isEmpty) {
          return Center(
              child: Text(
            "Pas de notification",
            style: Theme.of(context).textTheme.displayMedium,
          ));
        }
        return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  height: 0,
                  color: greyLight,
                )),
            itemCount: state.all.length,
            itemBuilder: (context, index) {
              final triggered = state.all[index];
              final date = DateFormat.yMd().format(triggered["date"]);
              final time = DateFormat.Hm().format(triggered["date"]);
              final value = AlertValue.values[triggered["typeNotification"]];
              final body = NotificationMessage.body(
                  value: value,
                  cryptoId: triggered["cryptoId"],
                  percent: triggered["percent"],
                  futurePrice: triggered["futurePrice"]);

              final header = NotificationMessage.header(
                  value: value,
                  cryptoId: triggered["cryptoId"],
                  percent: triggered["percent"],
                  futurePrice: triggered["futurePrice"]);

              return Material(
                borderRadius: BorderRadius.circular(10),
                color: triggered["open"] ? Colors.transparent : blue1,
                child: InkWell(
                    splashColor: blueLight,
                    highlightColor: blueLight,
                    onTap: () {
                      // update specific notification
                      context.read<NotificationTriggeredBloc>().add(
                          NotificationTriggeredEvent.openNotification(
                              triggered, index));

                      // Change route
                      Navigator.of(context).pushNamed(
                          CryptoAssetScreen.routeName,
                          arguments: triggered["cryptoId"]);
                    },
                    child: ListTile(
                        title: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                    NetworkImage(triggered["image"]),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            AutoSizeText(
                              header,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontFamily.montSerrat),
                            )
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            AutoSizeText(
                              body,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontFamily: FontFamily.montSerrat),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            AutoSizeText("$date $time",
                                style: TextStyle(
                                    fontFamily: FontFamily.montSerrat))
                          ],
                        ))),
              );
            });
      })),
    );
  }
}
