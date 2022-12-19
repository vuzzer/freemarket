import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/widget/seed_phrase_widget.dart';
import 'package:flutter/material.dart';

class SeedPhraseScreen extends StatelessWidget {
  const SeedPhraseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const AutoSizeText(
            "Your secret phrase",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          AutoSizeText(
            "Write or copy these words in the correct\norder and keep them in a safe place.",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              ...List.generate(
                  4,
                  ((ind) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(3, (index) {
                          return const SeedPhraseWidget();
                        }),
                      )))),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 18),
                      backgroundColor: blueLight,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  icon: const Icon(
                    Icons.copy_outlined,
                    color: Colors.white,
                  ),
                  label: const AutoSizeText(
                    "Copy",
                    style: TextStyle(color: Colors.white),
                  )),
                  const SizedBox(height: 65,),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 130,
                  padding: const EdgeInsets.all(40),
                  decoration: const BoxDecoration(color: blueLight),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF19A5D1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )))
            ],
          )
        ],
      ),
    );
  }
}
