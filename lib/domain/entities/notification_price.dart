import 'package:equatable/equatable.dart';


class NotificationPrice extends Equatable {
  final int idNotification;
  final String cryptoId;
  final double futurePrice;

  const NotificationPrice(
      {required this.idNotification,
      required this.cryptoId,
      required this.futurePrice});

  @override
  List<Map<String, dynamic>> get props => [{
    'idNotification': idNotification,
    'cryptoId': cryptoId,
    'futurePrice': futurePrice
  }];
}
