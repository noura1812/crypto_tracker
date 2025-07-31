import 'package:crypto_tracker/features/crypto/domain/entities/crypto_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

abstract class CryptoLocalDataSource {
  Future<List<CryptoEntity>> getCryptoList();
  Future<List<CryptoEntity>> getWishlist();
  Future<void> addToWishlist(String id);
  Future<void> removeFromWishlist(String id);
  Future<void> saveCryptoList(List<CryptoEntity> cryptoList);
}

@LazySingleton(as: CryptoLocalDataSource)
class CryptoLocalDataSourceImpl implements CryptoLocalDataSource {
  final Isar _isar;

  CryptoLocalDataSourceImpl({required Isar isar}) : _isar = isar;

  @override
  Future<void> saveCryptoList(List<CryptoEntity> cryptoList) async {
    await _isar.writeTxn(() async {
      for (final newItem in cryptoList) {
        final existing =
            await _isar.cryptoEntitys
                .filter()
                .idEqualTo(newItem.id)
                .findFirst();

        if (existing != null) {
          newItem.isFav = existing.isFav;
        }

        await _isar.cryptoEntitys.put(newItem);
      }
    });
  }

  @override
  Future<List<CryptoEntity>> getCryptoList() async {
    final list = await _isar.cryptoEntitys.where().findAll();
    return list;
  }

  @override
  Future<List<CryptoEntity>> getWishlist() async {
    final wishlist =
        await _isar.cryptoEntitys.filter().isFavEqualTo(true).findAll();
    return wishlist;
  }

  @override
  Future<void> addToWishlist(String id) async {
    await _isar.writeTxn(() async {
      final item = await _isar.cryptoEntitys.filter().idEqualTo(id).findFirst();
      if (item != null) {
        item.isFav = true;
        await _isar.cryptoEntitys.put(item);
      }
    });
  }

  @override
  Future<void> removeFromWishlist(String id) async {
    await _isar.writeTxn(() async {
      final item = await _isar.cryptoEntitys.filter().idEqualTo(id).findFirst();
      if (item != null) {
        item.isFav = false;
        await _isar.cryptoEntitys.put(item);
      }
    });
  }
}
