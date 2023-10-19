part of 'new_and_hot_bloc.dart';

@immutable
sealed class NewAndHotState {}

final class NewAndHotInitial extends NewAndHotState {}

final class UpcomingSuccessstate extends NewAndHotState {
  final bool isLoading;
  List<Upcoming> upcomingMovies;
  final Option<Either<MainFailure, List<Upcoming>>> UpcomingsResponse;

  UpcomingSuccessstate(
      {required this.isLoading,
      List<Upcoming>? upcomingMovies,
      required this.UpcomingsResponse})
      : upcomingMovies = upcomingMovies ?? <Upcoming>[];
}

final class EveryoneWatchingSuccessstate extends NewAndHotState {
  final bool isLoading;
  List<Everyonewatching> popularMovies;
  final Option<Either<MainFailure, List<Everyonewatching>>> popularsResponse;

  EveryoneWatchingSuccessstate(
      {required this.isLoading,
      List<Everyonewatching>? popularMovies,
      required this.popularsResponse})
      : popularMovies = popularMovies ?? <Everyonewatching>[];
}
