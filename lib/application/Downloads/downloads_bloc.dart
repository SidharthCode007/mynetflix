import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:mynetflix/Domain/core/failures/main_failure.dart';
import 'package:mynetflix/Domain/downloads/i_downloads_repo.dart';
import 'package:mynetflix/Domain/downloads/model/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo iDownloadsRepo;
  DownloadsBloc(this.iDownloadsRepo) : super(DownloadsInitial()) {
    on<GetdownlodsimagesEvent>(getdownlodsimagesEvent);
  }

  FutureOr<void> getdownlodsimagesEvent(
      GetdownlodsimagesEvent event, Emitter<DownloadsState> emit) async {
    emit(DownloadsImageFetchSuccessState(
        isLoading: true, downloadsResponse: none()));

    final Either<MainFailure, List<Downloads>> downloadImages =
        await iDownloadsRepo.getDownloadsImages();

    emit(downloadImages.fold(
        (failure) => DownloadsImageFetchSuccessState(
            isLoading: false, downloadsResponse: some(left(failure))),
        (success) => DownloadsImageFetchSuccessState(
            isLoading: false,
            downloadsResponse: Some(right(success)),
            downloads: success)));
  }
}
