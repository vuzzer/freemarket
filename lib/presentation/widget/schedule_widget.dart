import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/screens/crypto_asset_screen.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter/material.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  List<TimeFrame> timeFrame = [
    TimeFrame(
        title: "Market open", desc: "You'll be notified daily at 9:00 am EST"),
    TimeFrame(
        title: "Mid-day", desc: "You'll be notified daily at 12:00 pm EST"),
    TimeFrame(
        title: "Market close", desc: "You'll be notified daily at 4:00 pm EST"),
  ];
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child:  Column(
      children: [
      const SizedBox(
        height: 20,
      ),
      const AutoSizeText(
        "When would you like to receive daily Bitcoin alerts ?",
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      const SizedBox(
        height: 10,
      ),
      ...List.generate(
          timeFrame.length,
          (index) => Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: blueLight,
                  highlightColor: blueLight,
                  onTap: () {
                    //update(alert);
                  },
                  child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            timeFrame[index].title,
                            style:  TextStyle(
                              color: Colors.white,
                              fontFamily: FontFamily.montSerrat,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(height: 10,),
                          AutoSizeText(
                            timeFrame[index].desc,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 8),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                      trailing: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Switch.adaptive(
                                  value: timeFrame[index].value,
                                  activeColor: const Color(0xFF508D69),
                                  onChanged: (value) {
                                    setState(() {
                                      timeFrame[index].value = value;
                                    });
                                  })
                            ],
                          )))))),
                           const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonWidget(
              onPressed: () =>
                  Navigator.of(context).popUntil( ModalRoute.withName(CryptoAssetScreen.routeName) ),
              title: "Create alert",
              raduis: 10,
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 35, top: 10),
            child: ButtonWidget(
              onPressed: () => Navigator.of(context).popUntil( ModalRoute.withName(CryptoAssetScreen.routeName) ),
              color: blue1,
              title: "Dismiss",
              raduis: 10,
            ),
          ),
    ]));
  }
}

class TimeFrame {
  final String title;
  final String desc;
  bool value = false;
  TimeFrame({required this.title, required this.desc});
}
