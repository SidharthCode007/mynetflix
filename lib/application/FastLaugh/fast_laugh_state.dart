part of 'fast_laugh_bloc.dart';

@immutable
sealed class FastLaughState {}

final class FastLaughInitial extends FastLaughState {}

class FastlaughInitialSuccessState extends FastLaughState {
  List<Downloads> videosList;
  final bool isLoading;
  final bool isError;

  FastlaughInitialSuccessState(
      {List<Downloads>? videosList,
      required this.isLoading,
      required this.isError})
      : videosList = videosList ?? <Downloads>[];
}
