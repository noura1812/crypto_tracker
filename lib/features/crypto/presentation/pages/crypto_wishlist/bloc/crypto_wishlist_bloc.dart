import 'package:bloc/bloc.dart';
import 'package:crypto_tracker/core/network/error/failure.dart';
import 'package:crypto_tracker/core/network/models/async_result.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/crypto_entity.dart';
import 'package:crypto_tracker/features/crypto/domain/usecases/edit_wish_list_use_case.dart';
import 'package:crypto_tracker/features/crypto/domain/usecases/get_crypto_wish_list_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'crypto_wishlist_event.dart';
part 'crypto_wishlist_state.dart';

@lazySingleton
class CryptoWishlistBloc
    extends Bloc<CryptoWishlistEvent, CryptoWishlistState> {
  final GetCryptoWishListUseCase _getCryptoWishListUseCase;
  final EditWishListUseCase _editWishListUseCase;
  CryptoWishlistBloc(this._getCryptoWishListUseCase, this._editWishListUseCase)
    : super(CryptoWishlistInitial()) {
    on<CryptoWishlistEvent>((event, emit) {});
    on<GetCryptoWishList>(_onGetCryptoWishlist);
    on<EditWishlist>(_editCryptoWishlist);
  }
  _onGetCryptoWishlist(
    CryptoWishlistEvent event,
    Emitter<CryptoWishlistState> emit,
  ) async {
    var response = await _getCryptoWishListUseCase();
    switch (response) {
      case Data<List<CryptoEntity>>():
        emit(GetCryptoWishListSuccess(cryptos: response.data));
        break;
      case Error():
        emit(GetCryptoWishListError(error: response.error));
        break;
      default:
    }
  }

  bool isInWishlist(String id) {
    if (state is GetCryptoWishListSuccess) {
      GetCryptoWishListSuccess currentState = state as GetCryptoWishListSuccess;
      var crypto = currentState.cryptos.where((element) => element.id == id);
      return crypto.isNotEmpty;
    }
    return false;
  }

  _editCryptoWishlist(
    CryptoWishlistEvent event,
    Emitter<CryptoWishlistState> emit,
  ) async {
    if (state is GetCryptoWishListSuccess) {
      GetCryptoWishListSuccess currentState = state as GetCryptoWishListSuccess;
      if (event is EditWishlist) {
        bool add = !isInWishlist(event.cryptoEntity.id);
        var response = await _editWishListUseCase(
          event.cryptoEntity.id,
          add: add,
        );
        switch (response) {
          case Data<void>():
            emit(
              currentState.copyWith(
                cryptos:
                    add
                        ? [...currentState.cryptos, event.cryptoEntity]
                        : currentState.cryptos
                            .where(
                              (element) => element.id != event.cryptoEntity.id,
                            )
                            .toList(),
              ),
            );
            break;
          default:
        }
      }
    }
  }
}
