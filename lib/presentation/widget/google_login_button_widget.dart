import 'package:defi/constants/app_colors.dart';
import 'package:defi/domain/entities/wallet_setup.dart';
import 'package:defi/domain/usecases/setup/wallet_setup_handler.dart';
import 'package:defi/presentation/blocs/client/client_profil_bloc.dart';
import 'package:defi/presentation/provider/user_provider.dart';
import 'package:defi/presentation/screens/theta_screen.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/services/google_auth/google_oauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    WalletSetupHandler walletSetupHandler = sl.get<WalletSetupHandler>();
    //final alertBox = showDialogAlert(context);
    return ElevatedButton(
      onPressed: () async {
        BlocProvider.of<ClientProfilBloc>(context).add(Login() );
       /*  GoogleOAuth.googleLogin().then((data) async {
          //context.loaderOverlay.show();

          

          /* if (data != null) {
            //Logger().d(data.uid);
            user.setUser(data);

            //await EmailOTP.sendOTP(data.email as String);
            //context.loaderOverlay.hide();
            walletSetupHandler.generateMnemonic();
            //Logger().d(walletSetupHandler.state.mnemonic);
            walletSetupHandler.goto(WalletCreateSteps.confirm);
            if (await walletSetupHandler
                .confirmMnemonic(walletSetupHandler.state.mnemonic!)) {
              context.loaderOverlay.hide();
              navigator.pushNamed(ThetaScreen.routeName);
            }

            context.loaderOverlay.hide();
            //Display dialog box
            //alertBox();
          } else {
            context.loaderOverlay.hide();
          } */
        }).catchError((e) {
          logger.d(e.toString());
          context.loaderOverlay.hide();
        }); */
      },
      style: ElevatedButton.styleFrom(
          minimumSize: Size(MediaQuery.of(context).size.width, 50),
          backgroundColor: blue1),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
