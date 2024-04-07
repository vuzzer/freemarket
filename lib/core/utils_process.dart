import 'package:defi/core/create_unique_id.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/notification_crypto.dart';
import 'package:defi/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// Validate Value typed by user
bool validateInput(AlertValue typeAlert, CryptoInfo crypto, String value) {
  double constant = 500000; // Constant use to calculate the max price of crypto

  double predictionMaxPrice = (2 * crypto.currentPrice! + constant);

  bool success = false;

  if (value.isNotEmpty) {
    switch (typeAlert) {
      case AlertValue.price:
        final price = double.parse(value);
        success = price <= predictionMaxPrice;
        break;
      case AlertValue.decrease:
        // If percent precise a price that is low
        // of current price, it's true otherwise it's false
        // future price that doesn't exceed currentPrice
        final percent = double.parse(value);
        success =
            crypto.currentPrice! > (crypto.currentPrice! * (percent / 100));
        break;
      case AlertValue.increase:
        final percent = double.parse(value);
        success =
            crypto.currentPrice! + (crypto.currentPrice! * (percent / 100)) <
                predictionMaxPrice;
        break;
      case AlertValue.schedular:
        break;
    }
  }

  return success;
}

// Display calcul message based user input
String messageCalcul(AlertValue typeAlert, CryptoInfo crypto, String value) {
  final date = DateFormat.Hm().format(DateTime.now());
  if (value.isNotEmpty) {
    switch (typeAlert) {
      case AlertValue.price:
        break;
      case AlertValue.decrease:
        final percent = double.parse(value);
        final reduction = crypto.currentPrice! * (percent / 100);
        final futurePrice = crypto.currentPrice! - reduction;
        return LocaleKeys.setAlertScreen_alertFor.tr(args: [
          '\$${futurePrice.toStringAsFixed(2)} ',
          '(-$percent%)'
        ]);
      case AlertValue.increase:
        final percent = double.parse(value);
        final futurePrice =
            crypto.currentPrice! + crypto.currentPrice! * (percent / 100);
        return LocaleKeys.setAlertScreen_alertFor
            .tr(args: ['\$${futurePrice.toStringAsFixed(2)}', '(+$percent%)']);
      case AlertValue.schedular:
        break;
    }
  }

  return LocaleKeys.setAlertScreen_indicatePrice
      .tr(args: ['\$${crypto.currentPrice}', date]);
}

// Display message error for wrong inputs
String messageError(AlertValue typeAlert, CryptoInfo crypto, String value) {
  if (value.isNotEmpty) {
    switch (typeAlert) {
      case AlertValue.price:
        break;
      case AlertValue.decrease:
        return LocaleKeys.setAlertScreen_priceUnderZero.tr();
      case AlertValue.increase:
        break;
      case AlertValue.schedular:
        break;
    }
  }
  return LocaleKeys.setAlertScreen_priceTooHigh.tr();
}

// Return correct Notification accordin
// type of notification
NotificationCrypto createNotification(
    AlertValue typeAlert, CryptoInfo crypto, String value) {
  final id = createUniqueId();
  switch (typeAlert) {
    case AlertValue.price:
      final futurePrice = double.parse(value);
      return NotificationCrypto(
          idNotification: id,
          cryptoId: crypto.id,
          typeNotification: typeAlert,
          image: crypto.image,
          futurePrice: futurePrice);
    case AlertValue.decrease:
      final percent = double.parse(value);
      final reduction = crypto.currentPrice! * (percent / 100);
      final futurePrice = crypto.currentPrice! - reduction;
      return NotificationCrypto(
          idNotification: id,
          cryptoId: crypto.id,
          typeNotification: typeAlert,
          percent: percent,
          image: crypto.image,
          futurePrice: futurePrice);
    case AlertValue.increase:
      final percent = double.parse(value);
      final increase = crypto.currentPrice! * (percent / 100);
      final futurePrice = crypto.currentPrice! + increase;
      return NotificationCrypto(
          idNotification: id,
          cryptoId: crypto.id,
          typeNotification: typeAlert,
          percent: percent,
          image: crypto.image,
          futurePrice: futurePrice);
    case AlertValue.schedular:
      return NotificationCrypto(
        idNotification: id,
        cryptoId: crypto.id,
        image: crypto.image,
        typeNotification: typeAlert,
        cron: value,
      );
  }
}

NotificationCrypto updateNotification(
    AlertValue typeAlert, CryptoInfo crypto, String value, int id) {
  switch (typeAlert) {
    case AlertValue.price:
      final futurePrice = double.parse(value);
      return NotificationCrypto(
          idNotification: id,
          cryptoId: crypto.id,
          typeNotification: typeAlert,
          image: crypto.image,
          futurePrice: futurePrice);
    case AlertValue.decrease:
      final percent = double.parse(value);
      final reduction = crypto.currentPrice! * (percent / 100);
      final futurePrice = crypto.currentPrice! - reduction;
      return NotificationCrypto(
          idNotification: id,
          cryptoId: crypto.id,
          typeNotification: typeAlert,
          percent: percent,
          image: crypto.image,
          futurePrice: futurePrice);
    case AlertValue.increase:
      final percent = double.parse(value);
      final increase = crypto.currentPrice! * (percent / 100);
      final futurePrice = crypto.currentPrice! + increase;
      return NotificationCrypto(
          idNotification: id,
          cryptoId: crypto.id,
          typeNotification: typeAlert,
          percent: percent,
          image: crypto.image,
          futurePrice: futurePrice);
    case AlertValue.schedular:
      return NotificationCrypto(
        idNotification: id,
        cryptoId: crypto.id,
        image: crypto.image,
        typeNotification: typeAlert,
        cron: value,
      );
  }
}

// Extract principal language
Locale extractPrimaryLocale(Locale languageCode) {
  List<String> parts = languageCode.toString().split('_');
  String primaryLanguage = parts[0];
  return Locale(primaryLanguage);
}

// Format number
String formatNumber(num number) {
  if (number >= 1000000000) {
    return LocaleKeys.billion.tr(namedArgs: {
      'billion': '\$${(number / 1000000000).toStringAsFixed(1)}'
    });
  } else if (number >= 1000000) {
    return LocaleKeys.million.tr(
        namedArgs: {'million': '\$${(number / 1000000).toStringAsFixed(1)}'});
  } else if (number >= 1000) {
    return LocaleKeys.kilo
        .tr(namedArgs: {'kilo': '\$${(number / 1000).toStringAsFixed(1)}'});
  } else {
    return '\$${number.toStringAsFixed(2)}';
  }
}
