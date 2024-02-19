import 'package:defi/core/crontab.dart';
import 'package:defi/core/enum.dart';
import 'package:equatable/equatable.dart';

class NotificationCrypto extends Equatable {
  final int idNotification;
  final String cryptoId;
  final double futurePrice;
  final AlertValue typeNotification;
  final double percent;
  final String? cron;

  const NotificationCrypto(
      {required this.idNotification,
      required this.cryptoId,
      required this.typeNotification,
      this.percent = 0,
      this.cron,
      this.futurePrice = 0});

  @override
  List<Map<String, dynamic>> get props => [
        {
          'idNotification': idNotification,
          'cryptoId': cryptoId,
          'futurePrice': futurePrice,
          'percent': percent,
          'typeNotification': typeNotification.index,
          'cron': cron
        }
      ];
}
