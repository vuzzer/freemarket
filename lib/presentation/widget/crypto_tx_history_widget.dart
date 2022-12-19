import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/presentation/widget/crypto_asset_widget.dart';
import 'package:defi/presentation/widget/tx_history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../helpers/crypto_symbols.dart';

class CryptoTxHistoryWidget extends StatelessWidget {
  const CryptoTxHistoryWidget({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
        final size = ScreenUtil();
    return Expanded(
      child: Container(
          width: size.screenWidth,
          decoration: const BoxDecoration(
              color: blue1,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
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
                            child: Text(
                              'History',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Information',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ])),
                Expanded(
                    child: TabBarView(children: [
                        const SingleChildScrollView(child: TxHistoryWidget()),
                  ListView.separated(
                    padding: const EdgeInsets.all(0),
                    itemCount: 10,
                    separatorBuilder: (context, index) => Divider(
                      color: greyLight,
                    ),
                    itemBuilder: (context, index) => const AutoSizeText("History transaction", style: TextStyle(color: Colors.white),),
                  ),
                
                ]))
              ],
            ),
          )),
    );
  }
}
