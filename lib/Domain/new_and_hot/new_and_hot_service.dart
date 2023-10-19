import 'package:dartz/dartz.dart';
import 'package:mynetflix/Domain/core/failures/main_failure.dart';
import 'package:mynetflix/Domain/new_and_hot/model/EveryoneWatching/everyonewatching/everyonewatching.dart';
import 'package:mynetflix/Domain/new_and_hot/model/upcoming/upcoming/upcoming.dart';

abstract class NewAndHotService {
  Future<Either<MainFailure, List<Upcoming>>> getupcomingMovieData();
  Future<Either<MainFailure, List<Everyonewatching>>> getWatchingMovieData();
}
