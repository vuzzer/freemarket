import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/core/enum.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class CategorieNotificationWidget extends StatelessWidget {
  final Alert alert;
  final AlertValue radio;
  final Function update;
  final bool disable;
  const CategorieNotificationWidget(
      {Key? key,
      required this.alert,
      required this.radio,
      required this.update, this.disable = false})
      : super(key: key);

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
      MaterialState.selected
    };
    if (states.any(interactiveStates.contains)) {
      return blue;
    }
    return greyLight;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: disable ? blueLight : Colors.transparent,
        child: InkWell(
            splashColor: blueLight,
            highlightColor: blueLight,
            onTap: disable ? null : () {
              update(alert);
            },
            child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: blue1,
                    child: ClipOval(
                        child: Padding(
                            padding: const EdgeInsets.all(7),
                            child: Image.asset(
                              alert.image,
                              color: Colors.white,
                              fit: BoxFit.contain,
                            ))),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      alert.title,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Visibility(
                        visible: radio == alert.value,
                        child: AutoSizeText(
                          alert.desc,
                          style:
                              const TextStyle(color: Colors.white, fontSize: 8),
                          textAlign: TextAlign.justify,
                        ))
                  ],
                ),
                trailing: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Radio(
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            activeColor: blue,
                            value: alert.value,
                            groupValue: radio,
                            onChanged: disable ? null : (value) {
                              update(alert);
                              //select.setNetwork(network.config.value);
                            })
                      ],
                    )))));
  }
}
