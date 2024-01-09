import 'package:equatable/equatable.dart';

class TokenMarketData extends Equatable {
  final List<double> prices;
  final double marketCapitalization;
  final double volumeTotal;

  const TokenMarketData(
      {required this.prices,
      required this.marketCapitalization,
      required this.volumeTotal});
      
    @override
    List<Object?> get props =>  [prices, marketCapitalization, volumeTotal];
}
