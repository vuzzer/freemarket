import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:defi/constants/app_colors.dart';
import 'package:defi/domain/wallet/wallet_provider.dart';
import 'package:defi/presentation/screens/home_screen.dart';
import 'package:defi/presentation/screens/setting_screen.dart';
import 'package:defi/presentation/screens/swap_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ThetaScreen extends HookWidget {
  static const routeName = "/theta";

  ThetaScreen({Key? key}) : super(key: key);

  final _activeIndex = useState<int>(0);

  final List<IconData> _iconList = [
    FontAwesomeIcons.houseUser,
    FontAwesomeIcons.arrowRightArrowLeft,
    FontAwesomeIcons.gear,
  ];

  @override
  Widget build(BuildContext context) {
    final store = useWallet(context);
    final address = store.state.address;
    final network = store.state.network;

    useEffect(() {
      store.initialise();
    }, []);

    useEffect(
      () => store.listenTransfers(address, network),
      [address, network],
    );

    logger.d(address);

    return Scaffold(
      body: IndexedStack(
        index: _activeIndex.value,
        children: const [
          HomeScreen(),
          SwapScreen(),
           SettingScreen()
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: _iconList,
          backgroundColor: blueLight,
          activeColor: blue,
          inactiveColor: greyLight,
          activeIndex: _activeIndex.value,
          gapLocation: GapLocation.none,
          rightCornerRadius: 32,
          leftCornerRadius: 32,
          splashRadius: 0,
          onTap: (p0) {
            _activeIndex.value = p0;
          }),
    );
  }
}
