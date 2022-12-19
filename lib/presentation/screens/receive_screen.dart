import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/domain/wallet/wallet_provider.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:logger/logger.dart';
import '../../constants/app_colors.dart';
import '../../helpers/crypto_symbols.dart';
import '../widget/button_icon_widget.dart';

var logger = Logger();

class ReceiveScreen extends HookWidget {
  static const routeName = "/receive-screen";
  const ReceiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = useWallet(context);
    final address = store.state.address;
    logger.d(store.state.network.config.label);
    logger.d(address);
    return Scaffold(
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: (kSizeUnit * 3.2).w,
                  decoration: BoxDecoration(
                      color: blue1, borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "Your address",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          AutoSizeText(
                            address ?? "",
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            fixedSize: const Size.square(30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: blue1),
                        child: Icon(Icons.copy, color: greyLight),
                        onPressed: () {},
                      )
                    ],
                  ))),
          const SizedBox(
            height: 35,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                  onPressed: () {}),
              ButtonIconWidget(
                  iconData: Icons.wallet,
                  label: "Set sum",
                  raduis: 10,
                  onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}
