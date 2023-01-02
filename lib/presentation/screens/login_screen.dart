import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/domain/setup/wallet_setup_provider.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/google_login_button_widget.dart';
import 'package:defi/presentation/widget/phone_number_button_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login-screen";
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //final mediaQuery = MediaQuery.of(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100), child: AppBarWidget(title: "Se connecter",)),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title view
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Connectez-vous à',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey.withOpacity(0.6)),
                  ),
                  Row(
                    children: const [
                      Text(
                        "Theta",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: AutoSizeText(
                      "Choisissez l'une des options ci-dessous pour vous connecter.",
                      maxLines: 2,
                      style: TextStyle(color: Colors.grey.withOpacity(0.6)),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenSize.height * 0.1,
              ),

              //social networks
            /*   WalletSetupProvider(builder: (context, store) {
        // ignore: body_might_complete_normally_nullable
        return const GoogleLoginButtonWidget();
      }) */ 
              const SizedBox(
                height: 16,
              ),
              const PhoneNumberButton(),
              SizedBox(
                height: screenSize.height * 0.03,
              ),
            ],
          ),
        ),
      ),
      /*  bottomSheet: const Padding(
          
          padding: EdgeInsets.all(10),
          child: AutoSizeText(
            "En vous connectant, vous acceptez avec notre Terms & conditions et notre politique.",
            maxLines: 2,
          ),
        ) */
    );
  }
}
