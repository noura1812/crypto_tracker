import 'package:crypto_tracker/features/crypto/data/models/crypto_response.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/crypto_entity.dart';

extension CryptoMapper on CryptoResponse {
  CryptoEntity toEntity() {
    return CryptoEntity(
      id: id ?? '',
      name: name ?? '',
      symbol: symbol ?? '',
      image: image ?? '',
      currentPrice: 1.5,
      priceChangePercentage24h: 1.5,
    );
  }
}
