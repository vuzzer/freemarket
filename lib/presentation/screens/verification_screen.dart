import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/domain/wallet/wallet_provider.dart';
import 'package:defi/presentation/provider/user_provider.dart';
import 'package:defi/presentation/screens/theta_screen.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/keyboard_widget.dart';
import 'package:defi/presentation/widget/pin_code_widget.dart';
import 'package:defi/services/verification_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';
import '../../constants/app_colors.dart';

class VerificationScreen extends StatefulWidget {
  static const routeName = "/verification-screen";
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  Future<void> _onPressed() async{
    User? user = context.read<UserProvider>().getUser;
    await EmailOTP.validateOTP(user?.email as String, _controller.text);
  }

  @override
  Widget build(BuildContext context) {


    
    return  Scaffold(
      appBar: const AppBarWidget(title: "Verification"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const AutoSizeText(
            "Verify your Email",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          //Msg
          AutoSizeText.rich(TextSpan(children: [
            TextSpan(
                text: "We sent the 4-digit code to ",
                style: Theme.of(context).textTheme.bodyText2),
            TextSpan(
                text: "name@gmail.com\n",
                style: Theme.of(context).textTheme.bodyText1),
            TextSpan(
                text: "please enter the 4-digit code to continue",
                style: Theme.of(context).textTheme.bodyText2)
          ])),

          const SizedBox(
            height: 20,
          ),
          PinCodeWidget(
            pinCodeController: _controller,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText("Email didn't arrive ?",
                  style: Theme.of(context).textTheme.bodyText2),
              TextButton(
                  onPressed: () {},
                  child: AutoSizeText(
                    "Resend",
                    style: Theme.of(context).textTheme.bodyText1,
                  ))
            ],
          ),
          Container(
              height: 430,
              decoration: const BoxDecoration(color: blueLight),
              margin: const EdgeInsets.only(top: 60),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: KeyBoardWidget(
                controller: _controller,
                routeName: ThetaScreen.routeName,
                onPressed: _onPressed,
              ))
        ],
      ),
    );
  }
}
