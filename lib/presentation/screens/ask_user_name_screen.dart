import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/presentation/widget/button_widget.dart';
import 'package:defi/helpers/crypto_symbols.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AskUserNameScreen extends StatelessWidget {
  const AskUserNameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil size = ScreenUtil();
    var appBar = AppBar();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: appBar.preferredSize.height,
          ),
          Center(
              child: AutoSizeText(
            'Theta',
            style: Theme.of(context).textTheme.headline3,
          )),
          SizedBox(
            height: (kSizeUnit*0.2).h,
          ),
          Container(
            width: 100,
            height: 100,
            padding: EdgeInsets.all((kFontSizeUnit * 0.2).sp),
            decoration: BoxDecoration(
                color: greyLight,
                border: Border.all(color: Colors.grey.withOpacity(0.6)),
                shape: BoxShape.circle),
            child: const FittedBox(
                child: Icon(
              Icons.person,
              color: darkBlue,
            )),
          ),
           SizedBox(
            height:(kSizeUnit * 0.15).h,
          ),
          Container(
            width: size.screenWidth,
            height: (kSizeUnit * 1.5).h,
            padding: EdgeInsets.all((kFontSizeUnit * 1.6).sp),
            child: Form(
                child: Column(
              children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: greyLight))),
                    child: TextFormField(
                         autocorrect: false,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.characters,
                      cursorColor: greyLight,
                      style: TextStyle(color: greyLight),
                      decoration: InputDecoration(
                          hintText: 'Nom',
                          hintStyle: TextStyle(color: greyLight),
                          border: InputBorder.none),
                    )),
                SizedBox(
                  height: (kSizeUnit * 0.2).h,
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: greyLight))),
                    child: TextFormField(
                      autocorrect: false,
                       keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                       textCapitalization: TextCapitalization.words,
                      cursorColor: greyLight,
                      style: TextStyle(color: greyLight),
                      decoration: InputDecoration(
                          hintText: 'Prenom',
                          hintStyle: TextStyle(color: greyLight),
                          border: InputBorder.none),
                    ))
              ],
            )),
          ),
          Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: (kFontSizeUnit * 1.6).sp),
              child: ButtonWidget(onPressed: () {}, title: 'Continue'))
        ],
      ),
    );
  }
}
