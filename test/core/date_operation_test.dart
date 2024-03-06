import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

void main() {
  final logger = Logger();
  test('Program notification at mid-day', () {
    final time = DateTime.now();
    final twelve = time.copyWith(hour: 13, minute: 0, second: 0);
    logger.d(twelve.hour == time.hour);
    logger.d(DateFormat.Hm().format(twelve));
    logger.d(DateFormat.yMd().format(twelve));
  });

  test('Date should return this format `yMd` ', () async {
    final time = DateTime.now();
    logger.d(time.timeZoneName);
    logger.d(DateFormat.yMd().format(time));
  });
}
