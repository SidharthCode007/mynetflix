part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchInitialEvent extends SearchEvent {}

class SearchMovieEvent extends SearchEvent {
  final String movieName;

  SearchMovieEvent({required this.movieName});
}
