import 'package:defi/core/enum.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationMessage {
  // Describe body of notification message
  static String body(
      {required AlertValue value,
      required String cryptoId,
      double percent = 0,
      double futurePrice = 0}) {
    switch (value) {
      case AlertValue.price:
        return LocaleKeys.notification_reached
            .tr(args: [cryptoId, '\$$futurePrice']);
      case AlertValue.increase:
        return LocaleKeys.notification_increase
            .tr(args: [cryptoId, '$percent%', '(\$$futurePrice)']);
      case AlertValue.decrease:
        return LocaleKeys.notification_decrease
            .tr(args: [cryptoId, '$percent%', '(\$$futurePrice)']);
      case AlertValue.schedular:
        return LocaleKeys.notification_reached
            .tr(args: [cryptoId, '\$$futurePrice']);
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
        return LocaleKeys.notification_titlePrice.tr(args: [cryptoId]);
      case AlertValue.increase:
        return LocaleKeys.notification_increaseTitle.tr(args: [cryptoId]);
      case AlertValue.decrease:
        return LocaleKeys.notification_decreaseTitle.tr(args: [cryptoId]);
      case AlertValue.schedular:
        return LocaleKeys.notification_titleAlert.tr(args: [cryptoId]);
    }
  }

  // Header notification used by background process
  static Future<String> headerAsync(
      {required AlertValue value,
      required String cryptoId,
      double percent = 0,
      double futurePrice = 0}) async {
    final preferences = await SharedPreferences.getInstance();
    final language = preferences.getString('language');
    switch (value) {
      case AlertValue.price:
        if (language == 'fr') {
          return '$cryptoId prix';
        }
        return '$cryptoId price';
      case AlertValue.increase:
        if (language == 'fr') {
          return '$cryptoId hausse';
        }
        return '$cryptoId increase';
      case AlertValue.decrease:
        if (language == 'fr') {
          return '$cryptoId baisse';
        }
        return '$cryptoId decrease';
      case AlertValue.schedular:
        if (language == 'fr') {
          return '$cryptoId alerte';
        }
        return '$cryptoId alert';
    }
  }

    // Body of notification's message used by background process
  static Future<String> bodyAsync(
      {required AlertValue value,
      required String cryptoId,
      double percent = 0,
      double futurePrice = 0}) async {
    final preferences = await SharedPreferences.getInstance();
    final language = preferences.getString('language');

    switch (value) {
      case AlertValue.price:
        if (language == 'fr') {
          return "$cryptoId a atteint le prix de \$$futurePrice";
        }
        return "$cryptoId reached the price of \$$futurePrice";
      case AlertValue.increase:
        if (language == 'fr') {
          return "$cryptoId, une hausse du prix de $percent% (\$$futurePrice)";
        }
        return "$cryptoId, a price increase of $percent% (\$$futurePrice)";
      case AlertValue.decrease:
        if (language == 'fr') {
          return "$cryptoId, une baisse du prix de $percent% (\$$futurePrice)";
        }
        return "$cryptoId, a price decrease of $percent% (\$$futurePrice)";
      case AlertValue.schedular:
        if (language == 'fr') {
          return "$cryptoId, a atteint le prix de $percent% (\$$futurePrice)";
        }
        return "$cryptoId, reached the price of $percent% (\$$futurePrice)";
    }
  }
}
