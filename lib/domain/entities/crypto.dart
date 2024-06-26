import 'package:equatable/equatable.dart';

class CryptoInfo extends Equatable {
  final String image;
  final num? currentPrice;
  final num? priceChange24h;
  final String name;
  final String id;
  final num? marketCap;
  final num? marketCapRank;
  final num? circulatingSupply;
  final num? totalSupply;
  final num? allTimeHigh;
  final num? allTimeLow;
  final num? allTimeHigh24h;
  final num? allTimeLow24h;
  final DateTime allTimeHighDate;
  final DateTime allTimeLowDate;

  const CryptoInfo(
      {required this.id,
      required this.image,
      required this.currentPrice,
      required this.priceChange24h,
      required this.name,
      required this.marketCap,
      required this.marketCapRank,
      required this.circulatingSupply,
      required this.totalSupply,
      required this.allTimeHigh,
      required this.allTimeLow,
      required this.allTimeHigh24h,
      required this.allTimeLow24h,
      required this.allTimeHighDate,
      required this.allTimeLowDate});

  @override
  List<Object?> get props => [
        image,
        currentPrice,
        priceChange24h,
        name,
        marketCap,
        marketCapRank,
        circulatingSupply,
        totalSupply,
        allTimeHigh,
        allTimeLow,
        allTimeHighDate,
        allTimeLowDate,
        allTimeHigh24h,
        allTimeLow24h
      ];
}
