import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class NumberButtonWiget extends StatelessWidget {
  final int touch;
  final TextEditingController controller;
  const NumberButtonWiget({Key? key, required this.touch, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          if(controller.text.length < 4){
controller.text += touch.toString();
          }
          
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          minimumSize: const Size.square(60),
          backgroundColor: darkBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        child: Text(
          "$touch",
          style: const TextStyle(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ));
  }
}
