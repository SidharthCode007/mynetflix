import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mynetflix/Domain/core/failures/main_failure.dart';
import 'package:mynetflix/Domain/home/Model/home.dart';
import 'package:mynetflix/Domain/home/h/HomeService.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeService homeService;
  HomeBloc(this.homeService) : super(HomeInitial()) {
    on<HomeInitialevent>(homeInitialevent);
  }

  FutureOr<void> homeInitialevent(
      HomeInitialevent event, Emitter<HomeState> emit) async {
    emit(
        HomeInitialSuccessState(isLoading: true, hasError: false, stateId: ''));

    final _movieResult = await homeService.getHomeMovieData();
    final _tvResult = await homeService.getHomeTvData();

    final _state1 = _movieResult.fold(
      (MainFailure failure) {
        return HomeInitialSuccessState(
            isLoading: false,
            hasError: true,
            stateId: DateTime.now().millisecondsSinceEpoch.toString());
      },
      (MovieResponse responce) {
        final pastYear = responce.results;
        final trendingMovie = responce.results;
        final tenseDrama = responce.results;
        final southIndian = responce.results;
        return HomeInitialSuccessState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearList: pastYear,
          trendingMovieList: trendingMovie.sublist(0, 10),
          tenseDramaList: tenseDrama.sublist(0, 10),
          southIndianList: southIndian.sublist(0, 10),
          isLoading: false,
          hasError: false,
        );
      },
    );
    emit(_state1);
    final _state2 = _tvResult.fold(
        (MainFailure failure) => HomeInitialSuccessState(
            isLoading: false,
            hasError: true,
            stateId: ''), (MovieResponse resp) {
      final top10 = resp.results;
      return HomeInitialSuccessState(
        trendingTvList: top10.sublist(0, 10),
        isLoading: false,
        hasError: false,
        stateId: DateTime.now().millisecondsSinceEpoch.toString(),
      );
    });
    emit(_state2);
  }
}
