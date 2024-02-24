import 'package:defi/core/utils_type.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/notification_crypto.dart';

class ArgumentsScreen {
  final CryptoInfo crypto;
  final Alert alert;
  final NotificationCrypto? notification;
  ArgumentsScreen(
      {required this.crypto, required this.alert, this.notification});
}

// Arguments use in routing to choose_alert_screen
class ArgumentNotif {
  final CryptoInfo crypto;
  final NotificationCrypto? notification;
  final bool isUpdate;

  ArgumentNotif({required this.crypto, this.notification, this.isUpdate = false});
}
