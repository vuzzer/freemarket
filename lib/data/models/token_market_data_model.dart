import 'package:defi/domain/entities/token_market_data.dart';

class TokenMarketDataModel extends TokenMarketData {
  const TokenMarketDataModel(
      {required super.prices,
      required super.marketCapitalization,
      required super.volumeTotal});

  factory TokenMarketDataModel.fromJson(Map<String, dynamic> json) {
    final List rawMarketCaps = json["market_caps"];
    final List rawTotalVolumes = json["total_volumes"];
    final List rawPrices = json["prices"];

    // Data Market of token
    final marketCaps = rawMarketCaps.last as List;
    final totalVolumes = rawTotalVolumes.last as List;
    final prices = rawPrices.map((data) => data.last as double).toList();

    return TokenMarketDataModel(
        prices: prices,
        marketCapitalization: (marketCaps.last as num).toDouble(),
        volumeTotal: (totalVolumes.last as num).toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      "prices": prices,
      "market_caps": marketCapitalization,
      "total_volumes": volumeTotal
    };
  }
}
