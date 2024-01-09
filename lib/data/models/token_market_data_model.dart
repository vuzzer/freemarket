import 'package:defi/domain/entities/token_market_data.dart';

class TokenMarketDataModel extends TokenMarketData{
  const TokenMarketDataModel({required super.prices, required super.marketCapitalization, required super.volumeTotal});
  
    factory TokenMarketDataModel.fromJson(Map<String, dynamic> json) {
    return TokenMarketDataModel(
        prices: json["prices"],
        marketCapitalization: json["market_caps"],
        volumeTotal: json["total_volumes"]
        );
  }

  Map<String, dynamic> toJson() {
    return {
      "prices": prices,
      "market_caps": marketCapitalization,
      "total_volumes": volumeTotal
    };
  }
}