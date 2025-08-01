part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class OnSearchEvent extends SearchEvent {
  final String text;
  const OnSearchEvent(this.text);
  @override
  List<Object> get props => [text];
}
