import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/domain/wallet/wallet_handler.dart';
import 'package:defi/domain/wallet/wallet_action.dart';
import 'package:defi/presentation/context_provider.dart';
import 'package:defi/presentation/screens/set_amount_screen.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:logger/logger.dart';
import 'package:share_plus/share_plus.dart';
import '../../constants/app_colors.dart';
import '../../helpers/crypto_symbols.dart';
import '../widget/button_icon_widget.dart';

var logger = Logger();

class ReceiveScreen extends StatelessWidget {
  static const routeName = "/receive-screen";
  const ReceiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContextProviderWidget<WalletHandler>(
        builder: (context, value, child) => Scaffold(
              appBar: const AppBarWidget(
                title: "Receive",
                actions: true,
              ),
              body: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Center(
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          width: (kSizeUnit * 3.2).w,
                          decoration: BoxDecoration(
                              color: blue1,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        "Your address",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      AutoSizeText(
                                        value.states.address ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      )
                                    ],
                                  )),
                              Flexible(
                                  fit: FlexFit.loose,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0),
                                        elevation: 0,
                                        fixedSize: const Size.square(10),
                                        backgroundColor: blue1),
                                    child: Icon(Icons.copy, color: greyLight),
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(
                                          text: value.states.address));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              backgroundColor: blueLight,
                                              content: Text(
                                                "Copié",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                                textAlign: TextAlign.center,
                                              )));
                                    },
                                  ))
                            ],
                          ))),
                  const SizedBox(
                    height: 35,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 3,
                    color: blue1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 250,
                      height: 250,
                      child: QrImage(
                        data: "date",
                        size: 200,
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonIconWidget(
                          iconData: Icons.share,
                          label: "share",
                          raduis: 10,
                          onPressed: () async {
                            await Share.share(value.states.address ?? "");
                          }),
                      ButtonIconWidget(
                          iconData: Icons.wallet,
                          label: "Set sum",
                          raduis: 10,
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(SetAmountScreen.routeName);
                          }),
                    ],
                  )
                ],
              ),
            ));
  }
}
