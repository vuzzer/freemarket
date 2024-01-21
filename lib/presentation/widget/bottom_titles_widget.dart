import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class BottomTitlesWidget extends StatelessWidget {
  const BottomTitlesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
       const style = TextStyle(
      color: Color(0xff68737d),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    return Container(
      decoration: const BoxDecoration(color: darkBlue),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            padding: const EdgeInsets.all(
              10,
            ),
            decoration: BoxDecoration(
                color: blue1, borderRadius: BorderRadius.circular(30)),
            child: const AutoSizeText('Day', style: style)),
        Container(
            padding: const EdgeInsets.all(
              10,
            ),
            decoration: BoxDecoration(
                color: blue1, borderRadius: BorderRadius.circular(30)),
            child: const AutoSizeText('Week', style: style)),
        Container(
            padding: const EdgeInsets.all(
              10,
            ),
            decoration: BoxDecoration(
                color: blue1, borderRadius: BorderRadius.circular(30)),
            child: const AutoSizeText('Month', style: style)),
        Container(
            padding: const EdgeInsets.all(
              10,
            ),
            decoration: BoxDecoration(
                color: blue1, borderRadius: BorderRadius.circular(30)),
            child: const AutoSizeText('Year', style: style))
      ],
    ));
  }
}
