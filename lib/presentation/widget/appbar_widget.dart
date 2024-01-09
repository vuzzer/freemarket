import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/screens/home_screen.dart';
import 'package:defi/presentation/screens/theta_screen.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool leading, actions;

  const AppBarWidget(
      {Key? key,
      required this.title,

      this.leading = true,
      this.actions = false,
     
      })
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: darkBlue,
      elevation: 0,
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
        actions
            ? Container(
                margin: const EdgeInsets.only(right: 5),
                child: TextButton(
                    onPressed: () => Navigator.of(context).pushNamed(ThetaScreen.routeName ),
                    style: TextButton.styleFrom(
                        minimumSize: const Size.square(40),
                        backgroundColor: blueLight,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: const Text("Passer")) )
            : const SizedBox.shrink()
      ],
    );
  }
}
