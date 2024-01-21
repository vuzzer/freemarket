import 'package:equatable/equatable.dart';

class CryptoInfo extends Equatable {
  final String image;
  final double currentPrice;
  final double priceChange24h;
  final String name;
  final double marketCap;
  final int marketCapRank;
  final double circulatingSupply;
  final double totalSupply;
  final double allTimeHigh;
  final double allTimeLow;
  final DateTime allTimeHighDate;
  final DateTime allTimeLowDate;

  const CryptoInfo(
      {required this.image,
      required this.currentPrice,
      required this.priceChange24h,
      required this.name,
      required this.marketCap,
      required this.marketCapRank,
      required this.circulatingSupply,
      required this.totalSupply,
      required this.allTimeHigh,
      required this.allTimeLow,
      required this.allTimeHighDate,
      required this.allTimeLowDate});
      
        @override
        // TODO: implement props
        List<Object?> get props => [image, currentPrice, priceChange24h, name, marketCap, marketCapRank, circulatingSupply, totalSupply, allTimeHigh, allTimeLow, allTimeHighDate, allTimeLowDate];
}
