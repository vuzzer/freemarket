import 'package:defi/domain/entities/crypto.dart';
import 'package:intl/intl.dart';

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
        currentPrice: (crypto["current_price"] as num).toDouble(),
        priceChange24h: (crypto["price_change_percentage_24h"] as num).toDouble(),
        name: crypto["name"],
        marketCap: (crypto["market_cap"] as num ).toDouble(),
        marketCapRank: (crypto["market_cap_rank"] as num).toInt(),
        circulatingSupply: (crypto["circulating_supply"] as num).toDouble(),
        totalSupply: num.tryParse(crypto["total_supply"].toString()),
        allTimeHigh: (crypto["ath"] as num).toDouble(),
        allTimeLow: (crypto["atl"] as num).toDouble(),
        allTimeHighDate: DateTime.parse(crypto["ath_date"]),
        allTimeLowDate: DateTime.parse( crypto["ath_date"]));
  }

}
