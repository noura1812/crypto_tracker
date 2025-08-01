part of 'search_bloc.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final SearchResponse searchResponse;

  SearchSuccess({required this.searchResponse});
}

class SearchFailure extends SearchState {
  final Failure failure;
  SearchFailure({required this.failure});
}
