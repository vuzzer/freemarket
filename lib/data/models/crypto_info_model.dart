import 'package:defi/domain/entities/crypto.dart';

class CryptoInfoModel extends CryptoInfo {
  const CryptoInfoModel(
      {required super.image,
      required super.id,
      required super.currentPrice,
      required super.priceChange24h,
      required super.name,
      required super.marketCap,
      required super.marketCapRank,
      required super.circulatingSupply,
      required super.totalSupply,
      required super.allTimeHigh,
      required super.allTimeLow,
      required super.allTimeHighDate,
      required super.allTimeHigh24h,
      required super.allTimeLow24h,
      required super.allTimeLowDate});

  factory CryptoInfoModel.fromJson(Map<String, dynamic> crypto) {
    return CryptoInfoModel(
      image: crypto["image"],
      id: crypto["id"],
      currentPrice: num.tryParse(crypto["current_price"].toString()),
      priceChange24h:
          num.tryParse(crypto["price_change_percentage_24h"].toString()),
      name: crypto["name"],
      marketCap: num.tryParse(crypto["market_cap"].toString()),
      marketCapRank: num.tryParse(crypto["market_cap_rank"].toString()),
      circulatingSupply: num.tryParse(crypto["circulating_supply"].toString()),
      totalSupply: num.tryParse(crypto["total_supply"].toString()),
      allTimeHigh: num.tryParse(crypto["ath"].toString()),
      allTimeLow: num.tryParse(crypto["atl"].toString()),
      allTimeHighDate: DateTime.parse(crypto["ath_date"]),
      allTimeLowDate: DateTime.parse(crypto["ath_date"]),
      allTimeHigh24h: num.tryParse(crypto["high_24h"].toString()),
      allTimeLow24h: num.tryParse(crypto["low_24h"].toString()),
    );
  }
}
