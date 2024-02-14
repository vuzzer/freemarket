import 'package:defi/data/datasource/notification/notification_price_data.dart';
import 'package:defi/domain/entities/notification_price.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logger/logger.dart';

void main() {
  late NotificationPriceDataImpl notificationPriceDataImpl;
  setUpAll(() {
    Hive.initFlutter();
    notificationPriceDataImpl = NotificationPriceDataImpl();
  });

  test("Get notification created", () async {
    final result = await notificationPriceDataImpl.getNotificationPrice();
    Logger().d(result);
  });
}
