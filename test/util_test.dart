import 'package:logger/logger.dart';

var logger = Logger();

void main() {
  String msg = "4.76";
  logger.d(msg.contains("."));
}
