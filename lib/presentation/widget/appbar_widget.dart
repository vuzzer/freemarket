import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/styles/font_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/brightness/brightness_bloc.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool leading, actions;

  const AppBarWidget({
    super.key,
    required this.title,
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
        actions
            ? Container(
                margin: const EdgeInsets.only(right: 5),
                child: TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                        minimumSize: const Size.square(40),
                        backgroundColor: blueLight,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("Passer")))
            : const SizedBox.shrink()
      ],
    );
  }
}
