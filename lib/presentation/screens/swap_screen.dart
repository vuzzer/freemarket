import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/presentation/widget/swap_token_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/crypto_symbols.dart';

class SwapScreen extends StatelessWidget {
  static const routeName = "/swap-screen";
  const SwapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: "Swap",
        leading: false,
      ),
      body: Column(
        children: [
          const SwapTokenWidget(),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(0),
                minimumSize: const Size.square(60),
                backgroundColor: blue1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              child: const Icon(Icons.swap_vert)),
               const SizedBox(
            height: 20,
          ),
             const SwapTokenWidget(),
             const SizedBox(
            height: 60,
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 30), child: ButtonWidget(onPressed: (){}, title: "Exchange now", raduis: 10,))
        ],
      ),
    );
  }
}
