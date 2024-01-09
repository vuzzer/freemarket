import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final String idToken;
  final String currentOfMarket;
  final double decimalOfPrice;

  const Params({required this.idToken, required this.currentOfMarket, this.decimalOfPrice = 2});

  @override
  List<Object?> get props => [idToken, currentOfMarket];
}