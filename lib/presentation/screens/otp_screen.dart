import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/presentation/screens/secret_code_screen.dart';
import 'package:defi/presentation/widget/keyboard_widget.dart';
import 'package:defi/helpers/number_formatter.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = "/opt-code";
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
            "OTP Verification",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          //Msg
          AutoSizeText.rich(TextSpan(children: [
            TextSpan(
                text: "We will send you a one-time password\n",
                style: Theme.of(context).textTheme.bodyText2),
            TextSpan(
                text: "to this number",
                style: Theme.of(context).textTheme.bodyText1),
          ])),

          const SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 70,
                decoration: BoxDecoration(
                    color: darkBlue, borderRadius: BorderRadius.circular(30)),
                child: AutoSizeText(
                  "+225",
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                  width: 250,
                  height: 70,
                  child: Form(
                      child: TextFormField(
                    keyboardType: TextInputType.none,
                    inputFormatters: [
                      NumberFormatter(sample: 'xx-xx-xx-xx-xx', separator: '-')
                    ],
                    decoration: InputDecoration(
                        hintText: 'xx-xx-xx-xx-xx',
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.6)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.6),
                        )),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.6),
                        ))),
                  )))
            ],
          ),
          Container(
              height: 430,
              decoration: const BoxDecoration(color: blueLight),
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: KeyBoardWidget(
                controller: _controller,
                routeName: SecretCodeScreen.routeName,
                onPressed: () {
                  
                },
              ))
        ],
      ),
    );
  }
}
