import 'package:defi/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            splashColor: blueLight,
            highlightColor: blueLight,
            onTap: () {
              //update(alert);
            },
            child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: blue1,
                    child: ClipOval(
                        child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Image.asset(
                              alert.image,
                              color: Colors.white,
                              fit: BoxFit.contain,
                            ))),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      alert.title,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Visibility(
                        visible: radio == alert.value,
                        child: AutoSizeText(
                          alert.desc,
                          style:
                              const TextStyle(color: Colors.white, fontSize: 8),
                          textAlign: TextAlign.justify,
                        ))
                  ],
                ),
                trailing: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Switch.adaptive(
                            value: isSwitch,
                            onChanged: (value) {
                              setState(() {
                                isSwitch = value;
                              });
                            })
                      ],
                    )))));
  }
}

class TimeFrame {
  final String title;
  final String desc;
  
}
