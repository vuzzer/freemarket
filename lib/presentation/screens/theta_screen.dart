import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/domain/wallet/wallet_handler.dart';
import 'package:defi/presentation/context_provider.dart';
import 'package:defi/presentation/screens/home_screen.dart';
import 'package:defi/presentation/screens/setting_screen.dart';
import 'package:defi/presentation/screens/swap_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ThetaScreen extends StatefulWidget {
  static const routeName = "/theta";
  const ThetaScreen({Key? key}) : super(key: key);

  @override
  State<ThetaScreen> createState() => _ThetaScreenState();
}

class _ThetaScreenState extends State<ThetaScreen> {
  int _activeIndex = 0;

  final List<IconData> _iconList = [
    FontAwesomeIcons.houseUser,
    FontAwesomeIcons.arrowRightArrowLeft,
    FontAwesomeIcons.gear,
  ];

  @override
  Widget build(BuildContext context) {
    return ContextProviderWidget<WalletHandler>(
        onModelReady: (wallet) {
          wallet.initialise();
        },
        builder: (context, wallet, child) => Scaffold(
              body: IndexedStack(
                index: _activeIndex,
                children: const [HomeScreen(), SwapScreen(), SettingScreen()],
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
            ));
  }
}
