import 'package:defi/generated/locale_keys.g.dart';
import 'package:defi/presentation/blocs/cryptos/cryptos_bloc.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/styles/font_color.dart';
import 'package:defi/styles/media_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ReloadingWidget extends StatelessWidget {
  const ReloadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleKeys.homeScreen_networkErrorMsg.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: Media.headline3),
        ),
        Container(
          padding:
              const EdgeInsets.only(left: 30, right: 30, bottom: 35, top: 10),
          child: ButtonWidget(
            onPressed: () => sl<CryptosBloc>().add(const GetCryptoInfo()),
            color: FontColor.blue1,
            title: LocaleKeys.retryBtn.tr(),
            raduis: 10,
          ),
        )
      ],
    );
  }
}
