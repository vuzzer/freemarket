/* import 'package:defi/domain/wallet/wallet_state.dart';
import 'package:defi/presentation/context_provider.dart';
import 'package:defi/domain/setup/wallet_setup_handler.dart';
import 'package:defi/domain/setup/wallet_setup_state.dart';
import 'package:defi/domain/entities/wallet_setup.dart';
import 'package:defi/services/address_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:defi/domain/setup/wallet_setup_state.dart';
import 'package:provider/provider.dart';

class WalletSetupProvider extends StatelessWidget {
  final Widget scaffold;
  const WalletSetupProvider({super.key, required this.scaffold});


  @override
  Widget build(BuildContext context) {
    final store = useReducer<WalletSetup, WalletSetupAction>(reducer,
        initialState: WalletSetup(), initialAction: WalletSetupInit());

    final addressService = Provider.of<AddressService>(context);
    final handler = useMemoized(
      () => WalletSetupHandler(store, addressService),
      [addressService, store],
    );

    return provide(context, handler);
  }
}

 */