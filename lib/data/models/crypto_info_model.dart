import 'package:defi/domain/entities/crypto.dart';

class CryptoInfoModel extends CryptoInfo {
  const CryptoInfoModel(
      {required super.image,
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
      required super.allTimeLowDate});

  factory CryptoInfoModel.fromJson(Map<String, dynamic> crypto) {
    return CryptoInfoModel(
        image: crypto["image"],
        currentPrice: crypto["current_price"],
        priceChange24h: crypto["price_change_percentage_24h"],
        name: crypto["name"],
        marketCap: crypto["market_cap"],
        marketCapRank: crypto["market_cap_rank"],
        circulatingSupply: crypto["circulating_supply"],
        totalSupply: crypto["total_supply"],
        allTimeHigh: crypto["ath"],
        allTimeLow: crypto["atl"],
        allTimeHighDate: crypto["ath_date"],
        allTimeLowDate: crypto["ath_date"]);
  }
}
