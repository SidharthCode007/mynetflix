part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeInitialSuccessState extends HomeState {
  final List<Movie>? pastYearList;
  final List<Movie>? trendingMovieList;
  final List<Movie>? tenseDramaList;
  final List<Movie>? southIndianList;
  final List<Movie>? trendingTvList;
  final bool isLoading;
  final bool hasError;
  final String stateId;

  HomeInitialSuccessState(
      {this.trendingMovieList,
      this.tenseDramaList,
      this.southIndianList,
      this.trendingTvList,
      required this.isLoading,
      this.pastYearList,
      required this.hasError,
      required this.stateId});
}
