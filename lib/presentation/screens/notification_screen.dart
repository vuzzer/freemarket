import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/styles/font_family.dart';
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
              separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    height: 0,
                    color: greyLight,
                  )),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Material(
                  borderRadius: BorderRadius.circular(10),
                  color: blue1,
                  child: InkWell(
                      splashColor: blueLight,
                      highlightColor: blueLight,
                      onTap: () {},
                      child: ListTile(
                          title: Row(
                            children: [
                              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage("https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400"),
                  ),
                ),
                              const SizedBox(
                                width: 4,
                              ),
                              AutoSizeText(
                                "Bitcoin",
                                style: TextStyle(
                                    color: Colors.white,
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
                                "Le bitcoin a atteint 5%",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontFamily: FontFamily.montSerrat),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              AutoSizeText("03/08/2024 16:00",
                                  style: TextStyle(
                                      fontFamily: FontFamily.montSerrat))
                            ],
                          ))),
                );
              })),
    );
  }
}
