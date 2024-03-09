import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = "/notification";
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Mes Notifications",
        leading: true,
      ),
      body: SafeArea(
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              separatorBuilder: (context, index) => Divider(
                    height: 0,
                    color: greyLight,
                  ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Material(
                  borderRadius: BorderRadius.circular(10),
                  color: blue1,
                  child: InkWell(
                      splashColor: blueLight,
                      highlightColor: blueLight,
                      onTap: () {},
                      child: const ListTile(
                          title: Row(
                            children: [
                              Icon(
                                Icons.notification_add,
                                color: Colors.white,
                              ),
                              AutoSizeText(
                                "Bitcoin",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText("Le bitcoin a atteint 5%"),
                              AutoSizeText("03/08/2024 16:00")
                            ],
                          ))),
                );
              })),
    );
  }
}
