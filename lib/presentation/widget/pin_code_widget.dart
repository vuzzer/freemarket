import 'package:defi/constants/app_colors.dart';
import 'package:defi/helpers/show_dialog_alert.dart';
import 'package:defi/presentation/provider/user_provider.dart';
import 'package:defi/presentation/screens/theta_screen.dart';
import 'package:defi/services/verification_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';

class PinCodeWidget extends StatefulWidget {
  final TextEditingController pinCodeController;
  const PinCodeWidget({Key? key, required this.pinCodeController})
      : super(key: key);

  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {


  @override
  Widget build(BuildContext context) {
    //Size screenSize = MediaQuery.of(context).size;
    final navigator = Navigator.of(context);
    return ChangeNotifierProvider(
        create: (context) => UserProvider(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: PinCodeTextField(
            controller: widget.pinCodeController,
            appContext: context,
            length: 4,
            onChanged: (String code) {},
            keyboardType: TextInputType.none,
            pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldWidth: 50,
                fieldHeight: 55,
                activeFillColor: const Color(0xFFF6F6F6),
                selectedFillColor: const Color(0xFFF6F6F6),
                selectedColor: Colors.grey.withOpacity(0.666),
                inactiveColor: Colors.grey.withOpacity(0.4),
                inactiveFillColor: const Color(0xFFF6F6F6),
                activeColor: blue),
            onCompleted: (String finalCode) async {
              context.loaderOverlay.show();
              User? user =
                  Provider.of<UserProvider>(context, listen: false).getUser;
              //Check validating of OTP code
              EmailOTP.validateOTP(user!.email as String, finalCode)
                  .then((res) {
                if (res) {
                  context.loaderOverlay.hide();
                  navigator.pushNamed(ThetaScreen.routeName);
                } else {
                  context.loaderOverlay.hide();
                  //showDialogAlert(context);
                }
              }).catchError((e) {
                context.loaderOverlay.hide();
              });
            },
            animationType: AnimationType.fade,
            animationCurve: Curves.slowMiddle,
            animationDuration: const Duration(milliseconds: 100),
            cursorColor: Colors.white,
          ),
        ));
  }
}
