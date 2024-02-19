import 'package:defi/constants/app_colors.dart';
import 'package:defi/styles/font_size.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;
  final double raduis;
  final bool disable;
  const ButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.color = blue,
      this.disable = false,
      this.raduis = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? null : () => onPressed(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
          minimumSize: Size(MediaQuery.of(context).size.width, 50),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: blue),
              borderRadius: BorderRadius.circular(raduis),  ),
          
          
          backgroundColor: color ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style:  TextStyle(
                color: Colors.white,
                fontSize: FontSize.medium,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
