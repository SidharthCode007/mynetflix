import 'package:dartz/dartz.dart';
import 'package:mynetflix/Domain/core/failures/main_failure.dart';
import 'package:mynetflix/Domain/home/Model/home.dart';

abstract class HomeService {
  Future<Either<MainFailure, MovieResponse>> getHomeMovieData();
  Future<Either<MainFailure, MovieResponse>> getHomeTvData();
}
