import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/constants/app_font.dart';
import 'package:defi/helpers/crypto_symbols.dart';
import 'package:defi/presentation/widget/withdraw/tabview/adresse_widget.dart';
import 'package:defi/presentation/widget/withdraw/tabview/user_theta_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WithDrawCryptoWidget extends StatelessWidget {
  const WithDrawCryptoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const AutoSizeText(
              "Sélectionner une crypto",
              style: TextStyle(color: Colors.white, fontSize: fontSizeMd ),
            ),
            const SizedBox(
              height: 8,
            ),
            //Form to select crypto that you want withdraw
            Container(
                width: (kSizeUnit * 3.2).w,
                height: 50,
                decoration: BoxDecoration(
                    color: blue1, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Form(
                      child: TextFormField(
                    enabled: false,
                    keyboardType: TextInputType.none,
                    autocorrect: false,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                          bottom: 10,
                        ),
                        labelText: "Bitcoin",
                        labelStyle: TextStyle(color: greyLight),
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(CryptoFontIcons.BTC, color: greyLight),
                            const AutoSizeText(
                              "BTC",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          color: greyLight,
                        ),
                        border: InputBorder.none),
                  )),
                )),

            const SizedBox(
              height: 15,
            ),

            const AutoSizeText(
              "Envoyer à",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            const SizedBox(
              height: 20,
            ),

            Expanded(
                child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(color: blueLight))),
                      child: TabBar(
                          splashBorderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          labelColor: Colors.white,
                          indicatorPadding:
                              const EdgeInsets.symmetric(horizontal: 15),
                          unselectedLabelColor: greyLight,
                          tabs: const [
                            Tab(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Utilisateur de Theta',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  )),
                            ),
                            Tab(
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Adresse',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w700),
                                  )),
                            ),
                          ])),
                 const Expanded(
                      child: TabBarView(
                          children: [ UserThetaWidget(), AdresseWidget() ]))
                ],
              ),
            ))
          ],
        ));
  }
}
