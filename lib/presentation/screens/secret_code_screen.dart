import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/screens/theta_screen.dart';
import 'package:defi/presentation/widget/keyboard_widget.dart';
import 'package:defi/presentation/widget/pin_code_pwd_widget.dart';
import 'package:flutter/material.dart';

class SecretCodeScreen extends StatefulWidget {
  static const routeName = '/secret-code';

  const SecretCodeScreen({Key? key}) : super(key: key);

  @override
  State<SecretCodeScreen> createState() => _SecretCodeScreenState();
}

class _SecretCodeScreenState extends State<SecretCodeScreen> {
    late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const AutoSizeText(
            "Create the secret code",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
        Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: PinCodePwdWidget(controller: _controller,)),
          Container(
              height: 430,
              decoration: const BoxDecoration(color: blueLight),
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: KeyBoardWidget(controller: _controller,
              routeName: ThetaScreen.routeName, 
                  onPressed: () {
                  
                },
              ) )
        ],
      ),
    );
  }
}
