import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mynetflix/Domain/core/failures/main_failure.dart';
import 'package:mynetflix/Domain/downloads/i_downloads_repo.dart';
import 'package:mynetflix/Domain/downloads/model/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';

final videoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp40",
];

ValueNotifier<Set<int>> likedVideoNotifier = ValueNotifier({});

class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  final IDownloadsRepo iDownloadsRepo;
  FastLaughBloc(this.iDownloadsRepo) : super(FastLaughInitial()) {
    on<FastLaughInitialEvent>(fastLaughInitialEvent);
    on<LikeVideoEvent>(likeVideoEvent);
    on<UnlikeVideoEvent>(unlikeVideoEvent);
  }
  FutureOr<void> fastLaughInitialEvent(
      FastLaughInitialEvent event, Emitter<FastLaughState> emit) async {
    emit(FastlaughInitialSuccessState(isLoading: true, isError: false));

    Either<MainFailure, List<Downloads>> _result =
        await iDownloadsRepo.getDownloadsImages();
    final _state = _result.fold(
        (l) => FastlaughInitialSuccessState(isLoading: false, isError: true),
        (r) => FastlaughInitialSuccessState(
            isLoading: false, isError: false, videosList: r));
    emit(_state);
  }

  FutureOr<void> likeVideoEvent(
      LikeVideoEvent event, Emitter<FastLaughState> emit) {
    likedVideoNotifier.value.add(event.id);
    likedVideoNotifier.notifyListeners();
  }

  FutureOr<void> unlikeVideoEvent(
      UnlikeVideoEvent event, Emitter<FastLaughState> emit) {
    likedVideoNotifier.value.remove(event.id);
    likedVideoNotifier.notifyListeners();
  }
}
