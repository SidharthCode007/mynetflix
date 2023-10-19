import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:mynetflix/Domain/core/api_endpoints.dart';
import 'package:mynetflix/Domain/core/failures/main_failure.dart';
import 'package:mynetflix/Domain/home/Model/home.dart';
import 'package:mynetflix/Domain/home/h/HomeService.dart';

class HomeRepo implements HomeService {
  @override
  Future<Either<MainFailure, MovieResponse>> getHomeMovieData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.homeMovieUrl);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = MovieResponse.fromJson(response.data);

        return Right(result);
      } else {
        return Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, MovieResponse>> getHomeTvData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.homeTvUrl);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = MovieResponse.fromJson(response.data);

        return Right(result);
      } else {
        return Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure());
    }
  }
}
