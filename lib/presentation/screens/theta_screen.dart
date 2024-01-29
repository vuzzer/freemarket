import 'package:defi/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return const Scaffold(
      body: HomeScreen(),
    );
  }
}
