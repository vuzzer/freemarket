import 'package:auto_size_text/auto_size_text.dart';
import 'package:defi/presentation/screens/setting_screen/widgets/setting_option_widget.dart';
import 'package:defi/presentation/widget/appbar_widget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
    static const routeName = "/setting-screen";
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: "Setting",
          leading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              AutoSizeText(
                "Preferences",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              const SettingOptionWidget()
            ],
          ),
        ));
  }
}