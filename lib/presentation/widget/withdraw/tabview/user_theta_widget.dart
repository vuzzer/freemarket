import 'package:defi/constants/app_colors.dart';
import 'package:defi/helpers/crypto_symbols.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserThetaWidget extends StatelessWidget {
  const UserThetaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 20,
      ),
      Container(
          width: (kSizeUnit * 3.2).w,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: blue1, borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Form(
                child: TextFormField(
              keyboardType: TextInputType.none,
              autocorrect: false,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  labelText: "Contact destinataire",
                  labelStyle: TextStyle(color: greyLight),
                  border: InputBorder.none),
            )),
          ))
    ]);
  }
}
