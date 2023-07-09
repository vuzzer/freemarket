import 'package:defi/core/contracts/payment.dart';
import 'package:logger/logger.dart';

var logger = Logger(printer: PrettyPrinter());

void main() {
  final contract = Payment();
  logger.d(contract);
  
}
