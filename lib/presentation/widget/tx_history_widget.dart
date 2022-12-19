import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/widget/tx_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TxHistoryWidget extends StatelessWidget {
  const TxHistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = ScreenUtil();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
         const Padding(padding: EdgeInsets.only(left: 20, top: 7), child: AutoSizeText("Today")),
         ...List.generate(12, ((index) => Column(
          children: [
            const TxWidget(
              iconData: Icons.wallet,
               title: "Send", color: Colors.green),
            index < 11 ? Container( 
              height: 0.2,
              width: size.screenWidth , decoration: BoxDecoration(color: greyLight,)) : const SizedBox.shrink()
          ],
         )  ))
       
      ],
    );
  }
}
