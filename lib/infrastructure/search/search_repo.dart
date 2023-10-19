import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:mynetflix/Domain/core/api_endpoints.dart';
import 'package:mynetflix/Domain/core/failures/main_failure.dart';
import 'package:mynetflix/Domain/search/model/search/search.dart';
import 'package:mynetflix/Domain/search/search_service.dart';

@LazySingleton(as: SearchService)
class SearchRepo implements SearchService {
  @override
  Future<Either<MainFailure, List<Search>>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response =
          await Dio(BaseOptions()).get('${ApiEndPoints.search}$movieQuery');
          print(response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = (response.data['results'] as List)
            .map((e) => Search.fromJson(e))
            .toList();
        return Right(result);
      } else {
        return Left(MainFailure.serverFailure());
      }
    } catch (e) {
      print('error: $e');
      log(e.toString());
      return Left(MainFailure.clientFailure());
    }
  }
}
