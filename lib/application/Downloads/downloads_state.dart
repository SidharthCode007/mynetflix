part of 'downloads_bloc.dart';

@immutable
abstract class DownloadsState {}

final class DownloadsInitial extends DownloadsState {}

class DownloadsImageFetchSuccessState extends DownloadsState {
  final bool isLoading;
  final Option<Either<MainFailure, List<Downloads>>> downloadsResponse;
  List<Downloads> downloads;

  DownloadsImageFetchSuccessState(
      {required this.isLoading,
      required this.downloadsResponse,
      List<Downloads>? downloads})
      : downloads = downloads ?? <Downloads>[];
}
