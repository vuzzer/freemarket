import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/blocs/notification-price/notification_price_bloc.dart';
import 'package:defi/service_locator.dart';
import 'package:defi/styles/font_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customBottomSheet(
    BuildContext context, int idNotification, String cryptoId) {
  final size = ScreenUtil();

  showModalBottomSheet(
    context: context,
    elevation: 2,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(30), right: Radius.circular(30))),
    builder: (context) => Container(
      width: size.screenWidth,
      height: 200,
      decoration: const BoxDecoration(
          color: blue1,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(30), right: Radius.circular(30))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                  flex: 2,
                  child: Center(
                    child: Text("Target price"),
                  )),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ))
            ],
          ),
          Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: blueLight,
                  highlightColor: blueLight,
                  onTap: () {},
                  child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 15, right: 5),
                      title: const AutoSizeText(
                        'Update',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              splashRadius: 20,
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ))
                        ],
                      )))),
          Divider(
            color: greyLight,
          ),
          Material(
              color: Colors.transparent,
              child: InkWell(
                  splashColor: blueLight,
                  highlightColor: blueLight,
                  onTap: () {
                    // delete notification
                    sl<NotificationPriceBloc>()
                        .add(DeleteNotificationPrice(cryptoId, idNotification));
                    // Close bottomSheet
                    Navigator.of(context).pop();
                  },
                  child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 15, right: 5),
                      title: const AutoSizeText(
                        'Delete Alert',
                        style: TextStyle(
                          color: FontColor.red,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {},
                              splashRadius: 20,
                              icon: const Icon(
                                Icons.delete_forever_outlined,
                                color: FontColor.red,
                              ))
                        ],
                      ))))
        ],
      ),
    ),
  );
}
