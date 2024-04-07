import 'package:defi/domain/entities/token_market_data.dart';

class TokenMarketDataModel extends TokenMarketData {
  const TokenMarketDataModel(
      {required super.prices,
      required super.times,
      required super.marketCapitalization,
      required super.volumeTotal});

  factory TokenMarketDataModel.fromJson(Map<String, dynamic> json) {
    final List rawMarketCaps = json["market_caps"];
    final List rawTotalVolumes = json["total_volumes"];
    final List rawPrices = json["prices"];

    // Data Market of token
    final marketCaps = rawMarketCaps.last as List;
    final totalVolumes = rawTotalVolumes.last as List;
    final prices = rawPrices.map((data) => double.parse(data.last.toString())).toList();
    final times = rawPrices.map((data) => int.parse(data.first.toString()) ).toList();

    return TokenMarketDataModel(
        times: times,
        prices: prices,
        marketCapitalization: (marketCaps.last as num).toDouble(),
        volumeTotal: (totalVolumes.last as num).toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      "times": times,
      "prices": prices,
      "market_caps": marketCapitalization,
      "total_volumes": volumeTotal
    };
  }
}
