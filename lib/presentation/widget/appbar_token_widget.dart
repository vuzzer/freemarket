import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarTokenWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool leading, actions;

  const AppBarTokenWidget(
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
         IconButton(onPressed: (){}, splashRadius: 20, padding: EdgeInsets.zero, icon: const Icon(Icons.visibility_outlined, weight: 90, size: 30,) ),
         IconButton(onPressed: (){}, splashRadius: 20, padding: EdgeInsets.zero, icon: const Icon(Icons.star_outline, size: 30, weight: 30,) ),
         IconButton(onPressed: (){}, splashRadius: 20, padding: EdgeInsets.zero, icon: const Icon(Icons.notifications_outlined, weight: 90, size: 30,) ),
      ],
    );
  }
}
