import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:defi/domain/transfer/wallet_transfer_provider.dart';
import 'package:defi/domain/wallet/wallet_action.dart';
import 'package:defi/presentation/screens/qr_code_reader_screen.dart';
import 'package:defi/presentation/screens/set_amount_screen.dart';
import 'package:defi/presentation/screens/theta_screen.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/button_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:logger/logger.dart';
import '../../constants/app_colors.dart';
import '../../helpers/crypto_symbols.dart';
import '../widget/keyboard_widget.dart';

class SendScreen extends StatefulWidget {
  static const routeName = "/send-currency";
  const SendScreen({Key? key}) : super(key: key);

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController toController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Send",
        actions: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: (kSizeUnit * 3.2).w,
                  height: 50,
                  decoration: BoxDecoration(
                      color: blue1, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Form(
                        child: TextFormField(
                      controller: toController,
                      keyboardType: TextInputType.none,
                      autocorrect: false,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 10),
                          labelText: "Recipient address",
                          labelStyle: TextStyle(color: greyLight),
                          border: InputBorder.none),
                    )),
                  ))),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonIconWidget(
                  iconData: Icons.insert_link,
                  label: "insert",
                  raduis: 10,
                  onPressed: () {}),
              ButtonIconWidget(
                  iconData: Icons.qr_code_scanner,
                  label: "QR-code",
                  raduis: 10,
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(QRCodeReaderScreen.routeName);
                  }),
            ],
          ),
          const SizedBox(
            height: 70,
          ),
          Center(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: (kSizeUnit * 3.2).w,
                  height: 50,
                  decoration: BoxDecoration(
                      color: blue1, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Form(
                        child: TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.none,
                      autocorrect: false,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 10),
                          labelText: "Amount",
                          labelStyle: TextStyle(color: greyLight),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const AutoSizeText(
                                "ETH",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(CryptoFontIcons.ETH, color: greyLight)
                            ],
                          ),
                          border: InputBorder.none),
                    )),
                  ))),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtonIconWidget(
                  iconData: Icons.show_chart,
                  label: "max",
                  raduis: 10,
                  onPressed: () {}),
              ButtonIconWidget(
                  iconData: Icons.sync_alt,
                  label: "USD",
                  raduis: 10,
                  onPressed: () {}),
            ],
          ),
          const Spacer(),
          Container(
              padding: const EdgeInsets.only(bottom: 30),
              decoration: const BoxDecoration(color: blue1),
              child: KeyBoardWidget(
                controller: amountController,
                routeName: SetAmountScreen.routeName,
                amount: true,
                onPressed: () async {
                  context.loaderOverlay.show(); // show loading
                  /* final success = await transferStore.transfer(
                      store.state.network,
                      toController.text,
                      amountController.text); */
                  context.loaderOverlay.hide(); // close loading
                  /* if (success) {
                    // ignore: use_build_context_synchronously
                    Navigator.popUntil(
                        context, ModalRoute.withName(ThetaScreen.routeName));
                  } */
                  //Logger().d(store.state.errors);
                },
              )),
        ],
      ),
    );
  }
}
