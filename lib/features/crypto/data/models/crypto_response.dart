import 'package:equatable/equatable.dart';

class CryptoResponse extends Equatable {
  final String? id;
  final String? symbol;
  final String? name;
  final String? image;
  final double? currentPrice;
  final double? marketCap;
  final double? marketCapRank;
  final double? fullyDilutedValuation;
  final double? totalVolume;
  final double? high24h;
  final double? low24h;
  final double? priceChange24h;
  final double? priceChangePercentage24h;
  final double? marketCapChange24h;
  final double? marketCapChangePercentage24h;
  final double? circulatingSupply;
  final double? totalSupply;
  final double? maxSupply;
  final double? ath;
  final double? athChangePercentage;
  final DateTime? athDate;
  final double? atl;
  final double? atlChangePercentage;
  final DateTime? atlDate;
  final dynamic roi;
  final DateTime? lastUpdated;

  const CryptoResponse({
    this.id,
    this.symbol,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24h,
    this.low24h,
    this.priceChange24h,
    this.priceChangePercentage24h,
    this.marketCapChange24h,
    this.marketCapChangePercentage24h,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.roi,
    this.lastUpdated,
  });

  factory CryptoResponse.fromJson(Map<String, dynamic> json) {
    return CryptoResponse(
      id: json['id'] is String ? json['id'] as String : null,
      symbol: json['symbol'] is String ? json['symbol'] as String : null,
      name: json['name'] is String ? json['name'] as String : null,
      image: json['image'] is String ? json['image'] as String : null,

      marketCap:
          json['market_cap'] is num
              ? (json['market_cap'] as num).toDouble()
              : null,
      marketCapRank:
          json['market_cap_rank'] is num
              ? (json['market_cap_rank'] as num).toDouble()
              : null,
      fullyDilutedValuation:
          json['fully_diluted_valuation'] is num
              ? (json['fully_diluted_valuation'] as num).toDouble()
              : null,

      currentPrice:
          json['current_price'] is num
              ? (json['current_price'] as num).toDouble()
              : null,
      totalVolume:
          json['total_volume'] is num
              ? (json['total_volume'] as num).toDouble()
              : null,
      high24h:
          json['high_24h'] is num ? (json['high_24h'] as num).toDouble() : null,
      low24h:
          json['low_24h'] is num ? (json['low_24h'] as num).toDouble() : null,

      priceChange24h:
          json['price_change_24h'] is num
              ? (json['price_change_24h'] as num).toDouble()
              : null,
      priceChangePercentage24h:
          json['price_change_percentage_24h'] is num
              ? (json['price_change_percentage_24h'] as num).toDouble()
              : null,

      marketCapChange24h:
          json['market_cap_change_24h'] is num
              ? (json['market_cap_change_24h'] as num).toDouble()
              : null,
      marketCapChangePercentage24h:
          json['market_cap_change_percentage_24h'] is num
              ? (json['market_cap_change_percentage_24h'] as num).toDouble()
              : null,

      totalSupply:
          json['total_supply'] is num
              ? (json['total_supply'] as num).toDouble()
              : null,
      maxSupply:
          json['max_supply'] is num
              ? (json['max_supply'] as num).toDouble()
              : null,

      ath: json['ath'] is num ? (json['ath'] as num).toDouble() : null,
      athChangePercentage:
          json['ath_change_percentage'] is num
              ? (json['ath_change_percentage'] as num).toDouble()
              : null,

      atl: json['atl'] is num ? (json['atl'] as num).toDouble() : null,
      atlChangePercentage:
          json['atl_change_percentage'] is num
              ? (json['atl_change_percentage'] as num).toDouble()
              : null,

      atlDate:
          json['atl_date'] is String
              ? DateTime.tryParse(json['atl_date'])
              : null,

      roi: json['roi'], // You can parse it further if needed
      lastUpdated:
          json['last_updated'] is String
              ? DateTime.tryParse(json['last_updated'])
              : null,
    );
  }

  DateTime? tryParseDate(String? input) {
    try {
      if (input == null) return null;
      return DateTime.parse(input);
    } catch (_) {
      return null;
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'symbol': symbol,
    'name': name,
    'image': image,
    'current_price': currentPrice,
    'market_cap': marketCap,
    'market_cap_rank': marketCapRank,
    'fully_diluted_valuation': fullyDilutedValuation,
    'total_volume': totalVolume,
    'high_24h': high24h,
    'low_24h': low24h,
    'price_change_24h': priceChange24h,
    'price_change_percentage_24h': priceChangePercentage24h,
    'market_cap_change_24h': marketCapChange24h,
    'market_cap_change_percentage_24h': marketCapChangePercentage24h,
    'circulating_supply': circulatingSupply,
    'total_supply': totalSupply,
    'max_supply': maxSupply,
    'ath': ath,
    'ath_change_percentage': athChangePercentage,
    'ath_date': athDate?.toIso8601String(),
    'atl': atl,
    'atl_change_percentage': atlChangePercentage,
    'atl_date': atlDate?.toIso8601String(),
    'roi': roi,
    'last_updated': lastUpdated?.toIso8601String(),
  };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      symbol,
      name,
      image,
      currentPrice,
      marketCap,
      marketCapRank,
      fullyDilutedValuation,
      totalVolume,
      high24h,
      low24h,
      priceChange24h,
      priceChangePercentage24h,
      marketCapChange24h,
      marketCapChangePercentage24h,
      circulatingSupply,
      totalSupply,
      maxSupply,
      ath,
      athChangePercentage,
      athDate,
      atl,
      atlChangePercentage,
      atlDate,
      roi,
      lastUpdated,
    ];
  }
}
