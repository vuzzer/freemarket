import 'package:defi/core/enum.dart';

class NotificationMessage {
  // Describe body of notification message
  static String body(
      {required AlertValue value,
      required String cryptoId,
      double percent = 0,
      double futurePrice = 0}) {
    switch (value) {
      case AlertValue.price:
        return "$cryptoId a atteint le prix de \$$futurePrice";
      case AlertValue.increase:
        return "$cryptoId, une hausse du prix de $percent% (\$$futurePrice)";
      case AlertValue.decrease:
        return "$cryptoId, une baisse du prix de $percent% (\$$futurePrice)";
      case AlertValue.schedular:
        return "$cryptoId a atteint le prix de \$$futurePrice";
    }
  }

  // Describe header of notification message
  static String header(
      {required AlertValue value,
      required String cryptoId,
      double percent = 0,
      double futurePrice = 0}) {
    switch (value) {
      case AlertValue.price:
        return "$cryptoId prix";
      case AlertValue.increase:
        return "$cryptoId hausse";
      case AlertValue.decrease:
         return "$cryptoId baisse";
      case AlertValue.schedular:
        return "alerte $cryptoId";
    }
  }

}
