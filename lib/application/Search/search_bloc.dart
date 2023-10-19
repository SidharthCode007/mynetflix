import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:mynetflix/Domain/core/failures/main_failure.dart';
import 'package:mynetflix/Domain/downloads/i_downloads_repo.dart';
import 'package:mynetflix/Domain/downloads/model/downloads.dart';
import 'package:mynetflix/Domain/search/model/search/search.dart';
import 'package:mynetflix/Domain/search/search_service.dart';
import 'package:mynetflix/application/Downloads/downloads_bloc.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _iDownloadsRepo;
  final SearchService _searchService;
  SearchBloc(this._iDownloadsRepo, this._searchService)
      : super(SearchInitial()) {
    on<SearchInitialEvent>(searchInitialEvent);
    on<SearchMovieEvent>(searchMovieEvent);
  }

  FutureOr<void> searchInitialEvent(
      SearchInitialEvent event, Emitter<SearchState> emit) async {
    emit(SearchInitialSuccessState(isLoading: true, idleResponce: None()));

    final Either<MainFailure, List<Downloads>> idleResult =
        await _iDownloadsRepo.getDownloadsImages();

    emit(idleResult.fold(
        (failure) => SearchInitialSuccessState(
            isLoading: false, idleResponce: some(left(failure))),
        (success) => SearchInitialSuccessState(
            isLoading: false,
            idleResponce: some(right(success)),
            trending: success)));
  }

  FutureOr<void> searchMovieEvent(
      SearchMovieEvent event, Emitter<SearchState> emit) async {
    emit(SearchSuccessState(isLoading: true, searchResponse: None()));

    final Either<MainFailure, List<Search>> searchMovies =
        await _searchService.searchMovies(movieQuery: event.movieName);
    emit(searchMovies.fold(
        (failure) => SearchSuccessState(
            isLoading: false, searchResponse: some(left(failure))),
        (success) => SearchSuccessState(
            isLoading: false,
            searchResponse: some(right(success)),
            searchResults: success)));
  }
}
