import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/presentation/blocs/favoris/favoris_bloc.dart';
import 'package:defi/presentation/blocs/primary-crypto/primary_crypto_bloc.dart';
import 'package:defi/presentation/screens/choose_alert_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarTokenWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool leading, actions;
  final CryptoInfo crypto;

  const AppBarTokenWidget({
    Key? key,
    required this.title,
    required this.crypto,
    this.leading = true,
    this.actions = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: darkBlue,
      elevation: 0,
      centerTitle: true,
      title: AutoSizeText(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      leading: leading
          ? Container(
              margin: const EdgeInsets.only(left: 5),
              child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.square(60),
                      backgroundColor: blueLight,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: const Icon(Icons.arrow_back_ios)))
          : null,
      actions: [
        BlocBuilder<PrimaryCryptoBloc, PrimaryCryptoState>(
            builder: (context, state) {
          final bool visible = state.crypto?.id == crypto.id;
          return IconButton(
              onPressed: visible ? () => context.read<PrimaryCryptoBloc>().add(PrimaryCryptoEvent.removePrimaryCrypto(crypto)) :() => context.read<PrimaryCryptoBloc>().add( PrimaryCryptoEvent.changePrimaryCrypto(crypto)),
              splashRadius: 20,
              padding: EdgeInsets.zero,
              icon:  Icon( visible ? Icons.visibility :
                Icons.visibility_outlined,
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
                color: isFavoris ? blue : Colors.white,
              ));
        }),
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ChooseAlertScreen.routeName, arguments: crypto );
            },
            splashRadius: 20,
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.notifications_outlined,
              weight: 90,
              size: 30,
            )),
      ],
    );
  }

  Widget bodyBottomSheet(BuildContext context) {
    final size = ScreenUtil();
    return SizedBox(
      width: size.screenWidth,
      height: size.screenHeight * 0.9,
      child: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          style: ElevatedButton.styleFrom(maximumSize: const Size.square(50)),
          child: const Text("hello")),
    );
  }
}
