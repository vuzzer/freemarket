import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/blocs/favoris/favoris_bloc.dart';
import 'package:defi/presentation/widget/crypto_asset_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavorisListWidget extends StatelessWidget {
  const FavorisListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = ScreenUtil();

    return BlocBuilder<FavorisBloc, FavorisState>(builder: (context, state) {
      final favorisMap = state.favoris;
      if (favorisMap.isEmpty) {
        return const Center(child: Text("You have no favoris crypto"));
      }
      var favorisList =
          favorisMap.entries.map((crypto) => crypto.value).toList();
      favorisList = List.from(favorisList.reversed);
      return ListView.separated(
          padding: const EdgeInsets.all(0),
          itemCount: favorisList.length,
          separatorBuilder: (context, index) => Container(
              height: 0.2,
              width: size.screenWidth,
              decoration: BoxDecoration(
                color: greyLight,
              )),
          itemBuilder: (context, index) => CryptoAssetWidget(
                key: ValueKey(favorisList[index].id),
                crypto: favorisList[index],
              ));
    });
  }
}
