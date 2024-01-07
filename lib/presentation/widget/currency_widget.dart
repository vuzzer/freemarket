import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/helpers/enum.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class CurrencyWidget extends StatelessWidget {
  final NetworkType network;
  final Blockchain radio;
  final Function update;
  const CurrencyWidget(
      {Key? key,
      required this.network,
      required this.radio,
      required this.update})
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
        color: Colors.transparent,
        child: InkWell(
            splashColor: blueLight,
            highlightColor: blueLight,
            onTap: () {
              update(network.config.value);
            },
            child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    radius: 30,
                    child: Image.asset(
                        "assets/cryptos/${network.config.icon}.png"),
                  ),
                ),
                title: AutoSizeText(
                  network.config.label,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
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
                            value: network.config.value,
                            groupValue: radio,
                            onChanged: (value) {
                              update(network.config.value);
                              //select.setNetwork(network.config.value);
                            })
                      ],
                    )))));
  }
}
