import 'package:defi/core/enum.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

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
        return "Alert will set for -\$${futurePrice.abs().toStringAsFixed(2)} (-$percent%)";
      case AlertValue.increase:
        final percent = double.parse(value);
        final futurePrice =
            crypto.currentPrice! + crypto.currentPrice! * (percent / 100);
        return "Alert will set for \$${futurePrice.toStringAsFixed(2)} (+$percent%)";
      case AlertValue.schedular:
        break;
    }
  }
  return "Last update price: \$${crypto.currentPrice} of $date";
}

// Display message error for wrong inputs
String messageError(AlertValue typeAlert, CryptoInfo crypto, String value) {
  if (value.isNotEmpty) {
    switch (typeAlert) {
      case AlertValue.price:
        break;
      case AlertValue.decrease:
        return "Target price cannot be less than zero dollars.";
      case AlertValue.increase:
        break;
      case AlertValue.schedular:
        break;
    }
  }
  return "Target price is too high";
}
