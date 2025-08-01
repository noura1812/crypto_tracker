part of 'crypto_wishlist_bloc.dart';

abstract class CryptoWishlistState extends Equatable {
  const CryptoWishlistState();

  @override
  List<Object> get props => [];
}

class CryptoWishlistInitial extends CryptoWishlistState {}

class GetCryptoWishListLoading extends CryptoWishlistState {
  final String id;
  const GetCryptoWishListLoading({required this.id});
}

class GetCryptoWishListSuccess extends CryptoWishlistState {
  final List<CryptoEntity> cryptos;

  const GetCryptoWishListSuccess({required this.cryptos});

  GetCryptoWishListSuccess copyWith({List<CryptoEntity>? cryptos}) {
    return GetCryptoWishListSuccess(cryptos: cryptos ?? this.cryptos);
  }

  @override
  List<Object> get props => [cryptos];
}

class GetCryptoWishListError extends CryptoWishlistState {
  final Failure error;

  const GetCryptoWishListError({required this.error});

  @override
  List<Object> get props => [error];
}

class UnAuthorized extends CryptoWishlistState {
  final int time;

  const UnAuthorized({required this.time});
  @override
  List<Object> get props => [time];
}
