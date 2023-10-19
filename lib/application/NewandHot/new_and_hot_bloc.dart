import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:mynetflix/Domain/core/failures/main_failure.dart';
import 'package:mynetflix/Domain/new_and_hot/model/EveryoneWatching/everyonewatching/everyonewatching.dart';
import 'package:mynetflix/Domain/new_and_hot/model/upcoming/upcoming/upcoming.dart';
import 'package:mynetflix/Domain/new_and_hot/new_and_hot_service.dart';

part 'new_and_hot_event.dart';
part 'new_and_hot_state.dart';

class NewAndHotBloc extends Bloc<NewAndHotEvent, NewAndHotState> {
  final NewAndHotService newAndHotService;
  NewAndHotBloc(this.newAndHotService) : super(NewAndHotInitial()) {
    on<Upcominginitialevent>(upcominginitialevent);
    on<Everyonwwatchinginitialevent>(everyonwwatchinginitialevent);
  }

  FutureOr<void> upcominginitialevent(
      Upcominginitialevent event, Emitter<NewAndHotState> emit) async {
    emit(UpcomingSuccessstate(isLoading: true, UpcomingsResponse: None()));

    final Either<MainFailure, List<Upcoming>> upcominglist =
        await newAndHotService.getupcomingMovieData();
    emit(upcominglist.fold(
        (l) => UpcomingSuccessstate(
            isLoading: false, UpcomingsResponse: some(left(l))),
        (r) => UpcomingSuccessstate(
            isLoading: false,
            UpcomingsResponse: some(right(r)),
            upcomingMovies: r)));
  }

  FutureOr<void> everyonwwatchinginitialevent(
      Everyonwwatchinginitialevent event, Emitter<NewAndHotState> emit) async {
    emit(EveryoneWatchingSuccessstate(
        isLoading: true, popularsResponse: None()));

    final Either<MainFailure, List<Everyonewatching>> watchinglist =
        await newAndHotService.getWatchingMovieData();
    emit(watchinglist.fold(
        (l) => EveryoneWatchingSuccessstate(
            isLoading: false, popularsResponse: some(left(l))),
        (r) => EveryoneWatchingSuccessstate(
            isLoading: false,
            popularsResponse: some(right(r)),
            popularMovies: r)));
  }
}