import 'package:auto_size_text/auto_size_text.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/keyboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../helpers/crypto_symbols.dart';

class SetAmountScreen extends StatefulWidget {
  static const routeName = "/set-amount";
  const SetAmountScreen({Key? key}) : super(key: key);

  @override
  State<SetAmountScreen> createState() => _SetAmountScreenState();
}

class _SetAmountScreenState extends State<SetAmountScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Send",
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
                      color: blue1, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Form(
                        child: TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.none,
                      autocorrect: false,
                      cursorColor: Colors.white,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          labelText: "Amount",
                          contentPadding: const EdgeInsets.only(bottom: 10),
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
          const Spacer(),
          Container(
              padding: const EdgeInsets.only(bottom: 30),
              decoration: const BoxDecoration(color: blue1),
              child: KeyBoardWidget(
                controller: _controller,
                routeName: SetAmountScreen.routeName,
                amount: true,
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}
