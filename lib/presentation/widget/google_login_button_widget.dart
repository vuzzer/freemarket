import 'package:defi/constants/app_colors.dart';
import 'package:defi/domain/entities/wallet_setup.dart';
import 'package:defi/domain/setup/wallet_setup_action.dart';
import 'package:defi/helpers/show_dialog_alert.dart';
import 'package:defi/presentation/provider/user_provider.dart';
import 'package:defi/presentation/screens/theta_screen.dart';
import 'package:defi/services/google_auth/google_oauth.dart';
import 'package:defi/presentation/screens/verification_screen.dart';
import 'package:defi/services/verification_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class GoogleLoginButtonWidget extends StatelessWidget {
  const GoogleLoginButtonWidget({Key? key}) : super(key: key);

  /* useEffect((() {
      EmailOTP.init();
      return null;
    })); */

  @override
  Widget build(BuildContext context) {
    //final store = useWalletSetup(context);
    final navigator = Navigator.of(context);
    final user = Provider.of<UserProvider>(context, listen: false);
    //final alertBox = showDialogAlert(context);
    return ElevatedButton(
      onPressed: () async {
        GoogleOAuth.googleLogin().then((data) async {
          context.loaderOverlay.show();
          if (data != null) {
            //Logger().d(data.uid);
            user.setUser(data);

            //await EmailOTP.sendOTP(data.email as String);
            //context.loaderOverlay.hide();
            /* store.generateMnemonic();
            Logger().d(store.state.mnemonic);
            store.goto(WalletCreateSteps.confirm);
            if (await store.confirmMnemonic(store.state.mnemonic!)) {
                context.loaderOverlay.hide();
              navigator.pushNamed(ThetaScreen.routeName);
            } */
            context.loaderOverlay.hide();
            //Display dialog box
            //alertBox();
          } else {
            context.loaderOverlay.hide();
          }
        }).catchError((e) {
          context.loaderOverlay.hide();
        });
      },
      style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width, 50),
          backgroundColor: blue1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            FontAwesomeIcons.google,
            color: Colors.red,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              "Log in with Google",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
