import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/widget/number_button_widget.dart';
import 'package:flutter/material.dart';

class KeyBoardWidget extends StatelessWidget {
  final TextEditingController controller;
  final String routeName;
  final bool amount;
  final VoidCallback onPressed;
  final bool submit;
  const KeyBoardWidget(
      {Key? key,
      required this.controller,
      required this.routeName,
      required this.onPressed,
      this.submit = false,
      this.amount = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberButtonWiget(
              touch: '1',
              controller: controller,
              amount: amount,
            ),
            NumberButtonWiget(
              touch: '2',
              controller: controller,
              amount: amount,
            ),
            NumberButtonWiget(
              touch: '3',
              controller: controller,
              amount: amount,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberButtonWiget(
              touch: '4',
              controller: controller,
              amount: amount,
            ),
            NumberButtonWiget(
              touch: '5',
              controller: controller,
              amount: amount,
            ),
            NumberButtonWiget(
              touch: '6',
              controller: controller,
              amount: amount,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberButtonWiget(
              touch: '7',
              controller: controller,
              amount: amount,
            ),
            NumberButtonWiget(
              touch: '8',
              controller: controller,
              amount: amount,
            ),
            NumberButtonWiget(
              touch: '9',
              controller: controller,
              amount: amount,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NumberButtonWiget(
              touch: '.',
              controller: controller,
              amount: amount,
            ),
            NumberButtonWiget(
              touch: '0',
              controller: controller,
              amount: amount,
            ),
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
                )),
          ],
        )
        ,
        const SizedBox(
          height: 25,
        ),
        // Submit true, validation button is display in other case, validation button is not show
        submit
            ? ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 18),
                    backgroundColor: const Color(0XFF19A5D1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  'Valider',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
            : const SizedBox.shrink()
      ],
    );
  }
}
