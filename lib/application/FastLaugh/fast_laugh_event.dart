part of 'fast_laugh_bloc.dart';

@immutable
abstract class FastLaughEvent {}

class FastLaughInitialEvent extends FastLaughEvent {}

class LikeVideoEvent extends FastLaughEvent {
  final int id;

  LikeVideoEvent({required this.id});
}

class UnlikeVideoEvent extends FastLaughEvent {
  final int id;

  UnlikeVideoEvent({required this.id});
}
