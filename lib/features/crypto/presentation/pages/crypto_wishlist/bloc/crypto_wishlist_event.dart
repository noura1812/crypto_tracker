part of 'crypto_wishlist_bloc.dart';

abstract class CryptoWishlistEvent extends Equatable {
  const CryptoWishlistEvent();

  @override
  List<Object> get props => [];
}

class GetCryptoWishList extends CryptoWishlistEvent {}

class EditWishlist extends CryptoWishlistEvent {
  final CryptoEntity cryptoEntity;
  const EditWishlist({required this.cryptoEntity});
}
