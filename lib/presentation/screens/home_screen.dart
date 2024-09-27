import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/presentation/blocs/brightness/brightness_bloc.dart';
import 'package:defi/presentation/screens/credit_card_screen.dart';
import 'package:defi/presentation/screens/setting_screen.dart';
import 'package:defi/presentation/screens/stock_screen.dart';
import 'package:defi/styles/font_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //Index bottomNavigation
   int _activeIndex = 0;

  // IconList of bottomNavigation
  final List<IconData> _iconList = [
    FontAwesomeIcons.creditCard,
    FontAwesomeIcons.chartSimple,
    FontAwesomeIcons.gear,
  ];


  @override
  Widget build(BuildContext context) {
    final darkMode =
        context.select((BrightnessBloc b) => b.state.brightness == Mode.dark);
    return Scaffold(
         backgroundColor:
                      darkMode ? FontColor.darkBlue : FontColor.white1,
        body: IndexedStack(
                index: _activeIndex,
                children: const [CreditCardScreen(), StockScreen(), SettingScreen()],
              ),
            bottomNavigationBar: AnimatedBottomNavigationBar(
                  icons: _iconList,
                  backgroundColor: blueLight,
                  activeColor: blue,
                  inactiveColor: greyLight,
                  activeIndex: _activeIndex,
                  gapLocation: GapLocation.none,
                  rightCornerRadius: 32,
                  leftCornerRadius: 32,
                  splashRadius: 0,
                  onTap: (index) {
                    setState(() {
                      _activeIndex = index;
                    });
                  }),
             );
  }
}
