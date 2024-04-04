import 'package:defi/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NoInternetWiget extends StatelessWidget {
  const NoInternetWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      LocaleKeys.noInternet.tr(),
      style: Theme.of(context).textTheme.displayMedium,
    ));
  }
}
