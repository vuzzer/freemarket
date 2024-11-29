import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/core/arguments_screen.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/blocs/favoris/favoris_bloc.dart';
import 'package:defi/presentation/blocs/primary-crypto/primary_crypto_bloc.dart';
import 'package:defi/presentation/screens/choose_alert_screen.dart';
import 'package:defi/styles/font_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarTokenWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool leading, actions;
  final CryptoInfo crypto;

  const AppBarTokenWidget({
    super.key,
    required this.title,
    required this.crypto,
    this.leading = true,
    this.actions = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      title: AutoSizeText(
        title,
      ),
      leading: leading
          ? Container(
              margin: const EdgeInsets.only(left: 5),
              child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.square(60),
                      backgroundColor:
                          darkMode ? FontColor.blueLight : FontColor.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Icon(Icons.arrow_back_ios)))
          : null,
      actions: [
        BlocBuilder<PrimaryCryptoBloc, PrimaryCryptoState>(
            builder: (context, state) {
          final bool visible = state.crypto?.id == crypto.id;
          return IconButton(
              onPressed: visible
                  ? () => context
                      .read<PrimaryCryptoBloc>()
                      .add(PrimaryCryptoEvent.removePrimaryCrypto(crypto))
                  : () => context
                      .read<PrimaryCryptoBloc>()
                      .add(PrimaryCryptoEvent.changePrimaryCrypto(crypto)),
              splashRadius: 20,
              padding: EdgeInsets.zero,
              icon: Icon(
                visible ? Icons.visibility : Icons.visibility_outlined,
                color: color(activeColor: visible, darkMode: darkMode),
                weight: 90,
                size: 30,
              ));
        }),
        BlocBuilder<FavorisBloc, FavorisState>(builder: (context, state) {
          final favoris = state.favoris;
          final isFavoris = favoris.containsKey(crypto.id);
          return IconButton(
              onPressed: isFavoris
                  ? () {
                      context
                          .read<FavorisBloc>()
                          .add(RemoveFavorisEvent(crypto));
                    }
                  : () {
                      context.read<FavorisBloc>().add(AddFavorisEvent(crypto));
                    },
              splashRadius: 20,
              padding: EdgeInsets.zero,
              icon: Icon(
                isFavoris ? Icons.star : Icons.star_outline,
                size: 30,
                weight: 30,
                color: color(activeColor: isFavoris, darkMode: darkMode),
              ));
        }),
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ChooseAlertScreen.routeName,
                  arguments: ArgumentNotif(crypto: crypto));
            },
            splashRadius: 20,
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.notifications_outlined,
              color: darkMode ? FontColor.white : FontColor.black,
              weight: 90,
              size: 30,
            )),
      ],
    );
  }

  Color color({required bool activeColor, required bool darkMode}) {
    if (activeColor) {
      return darkMode ? FontColor.blue : FontColor.black;
    }
    return darkMode ? FontColor.white : FontColor.black;
  }
}
