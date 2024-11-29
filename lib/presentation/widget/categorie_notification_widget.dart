import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/styles/font_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_colors.dart';

class CategorieNotificationWidget extends StatelessWidget {
  final Alert alert;
  final AlertValue radio;
  final Function update;
  final bool disable;
  const CategorieNotificationWidget(
      {super.key,
      required this.alert,
      required this.radio,
      required this.update,
      this.disable = false});

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
      WidgetState.selected
    };
    if (states.any(interactiveStates.contains)) {
      return blue;
    }
    return greyLight;
  }

  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);
    return Material(
        color: disableColor(darkMode: darkMode, disable: disable),
        child: InkWell(
            splashColor: darkMode ? blueLight : greyLight,
            highlightColor: darkMode ? blueLight : greyLight,
            onTap: disable
                ? null
                : () {
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
                    ),
                    Visibility(
                        visible: radio == alert.value,
                        child: AutoSizeText(
                          alert.desc,
                          style: const TextStyle(fontSize: 8),
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
                                WidgetStateProperty.resolveWith(getColor),
                            activeColor: blue,
                            value: alert.value,
                            groupValue: radio,
                            onChanged: disable
                                ? null
                                : (value) {
                                    update(alert);
                                    //select.setNetwork(network.config.value);
                                  })
                      ],
                    )))));
  }

  Color disableColor({required bool darkMode, required bool disable}) {
    if (darkMode) {
      return disable ? blueLight : Colors.transparent;
    }
    return disable ? FontColor.white1.withOpacity(0.4) : Colors.transparent;
  }
}
