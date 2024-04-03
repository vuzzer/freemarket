import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/core/notifications/notification_message.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/blocs/notification-triggered/notification_triggered_bloc.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/loading_widget.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/font_family.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NotificationScreen extends StatefulWidget {
  static const routeName = "/notification";
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);
    // Get all notification
    sl<NotificationTriggeredBloc>()
        .add(const NotificationTriggeredEvent.getAll());
    return Scaffold(
      appBar:  AppBarWidget(
        title: LocaleKeys.notificationScreen_titleAppBar.tr(),
        leading: true,
      ),
      backgroundColor: darkMode ? FontColor.darkBlue : FontColor.white,
      body: SafeArea(child:
          BlocBuilder<NotificationTriggeredBloc, NotificationTriggeredState>(
              builder: (context, state) {
        if (state.loading) {
          return const LoadingWidget();
        }
        if (state.all.isEmpty) {
          return Center(
              child: Text(
            LocaleKeys.notificationScreen_noNotification.tr(),
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

              final header =  NotificationMessage.header(
                  value: value,
                  cryptoId: triggered["cryptoId"],
                  percent: triggered["percent"],
                  futurePrice: triggered["futurePrice"]);

              return Material(
                borderRadius: BorderRadius.circular(10),
                color: activeColor(
                    darkMode: darkMode, triggered: triggered['open']),
                child: InkWell(
                    splashColor: darkMode ? blueLight : FontColor.white1,
                    highlightColor: darkMode ? blueLight : FontColor.white1,
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

  Color activeColor({required bool darkMode, required bool triggered}) {
    if (darkMode) {
      return triggered ? Colors.transparent : blue1;
    }
    return triggered ? FontColor.white : FontColor.white1.withOpacity(0.4);
  }
}
