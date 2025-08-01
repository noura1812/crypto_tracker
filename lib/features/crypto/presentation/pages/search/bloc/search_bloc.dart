import 'package:bloc/bloc.dart';
import 'package:crypto_tracker/core/network/error/failure.dart';
import 'package:crypto_tracker/core/network/models/async_result.dart';
import 'package:crypto_tracker/features/crypto/data/models/search_response.dart';
import 'package:crypto_tracker/features/crypto/domain/usecases/search_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCase _searchUseCase;
  SearchBloc(this._searchUseCase) : super(SearchInitial()) {
    on<SearchEvent>((event, emit) {});
    on<OnSearchEvent>(_onSearch);
  }

  _onSearch(OnSearchEvent event, Emitter<SearchState> emit) async {
    var response = await _searchUseCase(event.text);
    switch (response) {
      case Data<SearchResponse>():
        emit(SearchSuccess(searchResponse: response.data));
        break;
      case Error():
        emit(SearchFailure(failure: response.error));
        break;
      default:
    }
  }
}
