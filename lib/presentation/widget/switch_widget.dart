import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/styles/font_family.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {
  final TimeFrame timeFrame;
  final Function onChange;
  const SwitchWidget(
      {super.key, required this.timeFrame, required this.onChange});

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
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      timeFrame.title,
                      style: TextStyle(
                          fontFamily: FontFamily.montSerrat,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      timeFrame.desc,
                      style: const TextStyle(fontSize: 8),
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
                            value: timeFrame.value,
                            activeColor: const Color(0xFF508D69),
                            onChanged: (value) => onChange(value))
                      ],
                    )))));
  }
}
