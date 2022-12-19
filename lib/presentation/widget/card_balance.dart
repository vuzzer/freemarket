import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardBalance extends StatelessWidget {
  const CardBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 220,
      padding: const EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(colors: [
            Color(0XFFA460ED),
            Color(0XFF19A5D1),
          ], stops: [
            0.4,
            1
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          AutoSizeText(
            "Portefeuille",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 60,
          ),
          AutoSizeText(
            "50,123.34 XOF",
            style: Theme.of(context).textTheme.headline3,
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.arrow_drop_up,
                color: Colors.green,
                size: 30,
              ),
              AutoSizeText(
                "50,123.34 XOF (1.23%)",
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          )
        ],
      ),
    );
  }
}
