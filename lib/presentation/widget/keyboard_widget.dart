import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/widget/number_button_widget.dart';
import 'package:flutter/material.dart';

class KeyBoardWidget extends StatelessWidget {
  final TextEditingController controller;
  final String routeName;
  final bool amount;
  final VoidCallback onPressed;
  const KeyBoardWidget(
      {Key? key,
      required this.controller,
      required this.routeName,
      required this.onPressed,
      this.amount = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int key = 0;

    return Column(
      children: [
        ...List.generate(
            3,
            ((ind) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(3, (index) {
                    key++;
                    return NumberButtonWiget(
                      touch: key,
                      controller: controller,
                      amount: amount,
                    );
                  }),
                )))),
        Padding(
            padding: amount
                ? const EdgeInsets.only(top: 5)
                : const EdgeInsets.only(
                    top: 5,
                    left: 50,
                  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                amount
                    ? TextButton(
                        onPressed: () {
                          controller.text += ",";
                          controller.selection = TextSelection.fromPosition(
                              TextPosition(offset: controller.text.length));
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          minimumSize: const Size.square(60),
                          backgroundColor: darkBlue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        child: const Text(
                          ",",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ))
                    : const SizedBox.shrink(),
                NumberButtonWiget(touch: 0, controller: controller,  amount: amount),
                TextButton(
                    onPressed: () {
                      if (controller.text.isNotEmpty) {
                        controller.text = controller.text
                            .substring(0, controller.text.length - 1);
                        //Change the cursor position
                        controller.selection = TextSelection.fromPosition(
                            TextPosition(offset: controller.text.length));
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      minimumSize: const Size.square(60),
                      backgroundColor: darkBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    child: const Icon(
                      Icons.backspace_outlined,
                      color: Colors.white,
                    ))
              ],
            )),
        const SizedBox(
          height: 25,
        ),
        ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 18),
                backgroundColor: const Color(0XFF19A5D1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: const Text(
              'Valider',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
