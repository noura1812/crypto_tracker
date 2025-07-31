import 'package:isar/isar.dart';

part 'crypto_entity.g.dart';

@collection
class CryptoEntity {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  String id;
  @Index()
  bool isFav;

  String? name;
  String? symbol;
  String? image;
  double? currentPrice;
  double? priceChangePercentage24h;
  CryptoEntity({
    required this.id,
    this.name,
    this.symbol,
    this.image,
    this.currentPrice,
    this.priceChangePercentage24h,
    this.isFav = false,
  });
}
