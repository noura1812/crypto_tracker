part of 'crypto_bloc.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object> get props => [];
}

class CryptoInitial extends CryptoState {}

class GetCryptoListLoading extends CryptoState {}

class GetCryptoListSuccess extends CryptoState {
  final List<CryptoEntity> cryptos;
  final bool isLoadingMore;
  final String? errorMessage;

  const GetCryptoListSuccess({
    required this.cryptos,
    this.isLoadingMore = false,
    this.errorMessage,
  });

  GetCryptoListSuccess copyWith({
    List<CryptoEntity>? cryptos,
    bool? isLoadingMore,
    String? errorMessage,
  }) {
    return GetCryptoListSuccess(
      cryptos: cryptos ?? this.cryptos,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object> get props => [cryptos, isLoadingMore];
}

class GetCryptoListError extends CryptoState {
  final Failure failure;

  const GetCryptoListError({required this.failure});
}
