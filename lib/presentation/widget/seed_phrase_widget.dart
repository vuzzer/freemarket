import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SeedPhraseWidget extends StatelessWidget {
  const SeedPhraseWidget({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: darkBlue,
        border: Border.all(color: blueLight),
        borderRadius: BorderRadius.circular(20)
      ),
      child: const Center(child: AutoSizeText("hello", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)), ),
    );
  }
}
