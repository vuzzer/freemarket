import 'package:equatable/equatable.dart';

// Use to get market_chart crypto
class Params extends Equatable {
  final String idToken;
  final String currentOfMarket;
  final double decimalOfPrice;
  final int periode;

  const Params(
      {required this.idToken,
      required this.currentOfMarket,
      this.periode = 1,
      this.decimalOfPrice = 2});

  @override
  List<Object?> get props => [idToken, currentOfMarket];
}

