part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

final class SearchInitial extends SearchState {}

class SearchInitialSuccessState extends SearchState {
  final bool isLoading;
  final Option<Either<MainFailure, List<Downloads>>> idleResponce;
  List<Downloads> trending;

  SearchInitialSuccessState(
      {required this.isLoading,
      required this.idleResponce,
      List<Downloads>? trending})
      : trending = trending ?? <Downloads>[];
}

class SearchSuccessState extends SearchState {
  final bool isLoading;
  final Option<Either<MainFailure, List<Search>>> searchResponse;
  List<Search> searchResults;

  SearchSuccessState(
      {required this.isLoading,
      required this.searchResponse,
      List<Search>? searchResults})
      : searchResults = searchResults ?? <Search>[];
}
