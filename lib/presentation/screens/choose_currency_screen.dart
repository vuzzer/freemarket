import 'package:defi/constants/app_colors.dart';
import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/domain/wallet/wallet_handler.dart';
import 'package:defi/domain/wallet/wallet_provider.dart';
import 'package:defi/helpers/enum.dart';
import 'package:defi/presentation/screens/receive_screen.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/presentation/widget/currency_widget.dart';
import 'package:defi/helpers/crypto_symbols.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';

class ChooseCurrencyScreen extends StatefulWidget {
  static const routeName = "/choose-currency";

  const ChooseCurrencyScreen({Key? key}) : super(key: key);

  @override
  State<ChooseCurrencyScreen> createState() => _ChooseCurrencyScreenState();
}

class _ChooseCurrencyScreenState extends State<ChooseCurrencyScreen> {
  Blockchain radio = Blockchain.initial;

  void _update(Blockchain value) {
    setState(() {
      radio = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final store = useWallet(context);
    Logger().d(store.state.address);
    final networks = NetworkType.enabledValues;
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Receive",
        leading: false,
        actions: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: (kSizeUnit * 3).w,
                  height: 50,
                  decoration: BoxDecoration(
                      color: blue1, borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Form(
                        child: TextFormField(
                      autocorrect: false,
                      cursorColor: greyLight,
                      style: TextStyle(color: greyLight),
                      decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: greyLight),
                          suffixIcon: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                backgroundColor: blue1),
                            child: Icon(Icons.search, color: greyLight),
                            onPressed: () {},
                          ),
                          border: InputBorder.none),
                    )),
                  ))),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.separated(
            padding: const EdgeInsets.all(0),
            itemCount: networks.length,
            separatorBuilder: (context, index) => Divider(
              color: greyLight,
            ),
            itemBuilder: (context, index) => CurrencyWidget(
              radio: radio,
              update: _update,
              network: networks[index],
            ),
          )),
          Container(
            padding: const EdgeInsets.all(30),
            child: ButtonWidget(
              disable: radio == Blockchain.initial,
              onPressed: () =>
                  Navigator.of(context).pushNamed(ReceiveScreen.routeName),
              title: "Next",
              raduis: 10,
            ),
          )
        ],
      ),
    );
  }
}
