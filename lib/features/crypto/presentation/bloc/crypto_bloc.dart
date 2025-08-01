import 'package:bloc/bloc.dart';
import 'package:crypto_tracker/core/config/constants.dart';
import 'package:crypto_tracker/core/helpers/snack_bar_helper.dart';
import 'package:crypto_tracker/core/network/error/failure.dart';
import 'package:crypto_tracker/core/network/models/async_result.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/crypto_entity.dart';
import 'package:crypto_tracker/features/crypto/domain/entities/crypto_parameters/crypto_parameters.dart';
import 'package:crypto_tracker/features/crypto/domain/usecases/get_crypto_list_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'crypto_event.dart';
part 'crypto_state.dart';

@injectable
class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  final GetCryptoListUseCase _getCryptoListUseCase;
  CryptoBloc(this._getCryptoListUseCase) : super(CryptoInitial()) {
    on<CryptoEvent>((event, emit) {});
    on<GetCryptoList>(_onGetCryptoList);
    on<LoadNextPage>(_onLoadNextPage);
  }

  CryptoParameters _parameters = CryptoParameters();
  Future _onGetCryptoList(
    GetCryptoList event,
    Emitter<CryptoState> emit,
  ) async {
    emit(GetCryptoListLoading());

    final result = await _getCryptoListUseCase(_parameters);
    switch (result) {
      case Data<List<CryptoEntity>>():
        emit(GetCryptoListSuccess(cryptos: result.data));
        break;
      case Error():
        if (result.data != null) {
          emit(
            GetCryptoListSuccess(
              cryptos: result.data!,
              errorMessage: result.error.toString(),
            ),
          );
        } else {
          emit(GetCryptoListError(failure: result.error));
        }
      default:
    }
  }

  Future<void> _onLoadNextPage(
    LoadNextPage event,
    Emitter<CryptoState> emit,
  ) async {
    if (state is! GetCryptoListSuccess) return;
    GetCryptoListSuccess currentState = state as GetCryptoListSuccess;

    if (currentState.isLoadingMore) return;
    if (currentState.cryptos.length < AppConstants.perPage) return;

    emit(currentState.copyWith(isLoadingMore: true));

    _parameters = _parameters.copyWith(page: _parameters.page + 1);
    final result = await _getCryptoListUseCase(_parameters);
    switch (result) {
      case Data<List<CryptoEntity>>():
        final combined = [...currentState.cryptos, ...result.data];
        emit(GetCryptoListSuccess(cryptos: combined));
        break;
      case Error():
        _parameters = _parameters.copyWith(page: _parameters.page - 1);

        emit(
          currentState.copyWith(
            isLoadingMore: false,
            errorMessage: result.error.toString(),
          ),
        );

        SnackBarHelper.showErrorSnackBar(
          message: 'Error loading more data:\n${result.error.toString()}',
        );
      // emit(GetCryptoListError(failure: result.error));
      default:
    }
  }
}
