import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/domain/contracts/payment.dart';
import 'package:defi/domain/entities/network_type.dart';
import 'package:defi/helpers/enum.dart';
import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class PaymentMethodWidget extends StatelessWidget {
  final PaymentType payment;
  final PaymentType radio;
  final Function update;
  const PaymentMethodWidget(
      {Key? key,
      required this.payment,
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
              update(payment);
            },
            child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "assets/payment/${payment.name}.png",
                    ),
                  ),
                ),
                title: AutoSizeText(
                  payment.name,
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
                            value: payment,
                            groupValue: radio,
                            onChanged: (value) {
                              update(payment);
                              //select.setNetwork(network.config.value);
                            })
                      ],
                    )))));
  }
}
