import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mynetflix/Domain/core/api_endpoints.dart';
import 'package:mynetflix/Domain/core/failures/main_failure.dart';
import 'package:mynetflix/Domain/new_and_hot/model/EveryoneWatching/everyonewatching/everyonewatching.dart';
import 'package:mynetflix/Domain/new_and_hot/model/upcoming.dart';
import 'package:mynetflix/Domain/new_and_hot/new_and_hot_service.dart';


class NewAndHotImpl implements NewAndHotService {
  @override
  Future<Either<MainFailure, List<Everyonewatching>>>
      getWatchingMovieData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.everyoneswatching);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = (response.data['results'] as List)
            .map((e) => Everyonewatching.fromJson(e))
            .toList();
        return right(result);
      } else {
        return left(MainFailure.serverFailure());
      }
    } catch (e) {
      return left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<Upcoming>>> getupcomingMovieData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.upcoming);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = (response.data['results'] as List).map((e){
          return Upcoming.fromJson(e);
        }).toList();
        print("ADCD :  ${result.toString()}");
        return right(result);
      } else {
        print('object 1');
        return left(MainFailure.serverFailure()); 
      }
    } catch (e) {
      log('my log: ${e.toString()}');
      return left(MainFailure.clientFailure());
    } 
  }}
/*       try {
    final Response response = await Dio(BaseOptions()).get(ApiEndPoints.upcoming);
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response.data.containsKey('results')) {
        final result = (response.data['results'] as List).map((e) {
          return Upcoming.fromJson(e);
        }).toList();
        print("Upcoming Movies: ${result.toString()}");
        return right(result);
      } else {
        // Handle the case when 'results' field is missing in the response
        print('No "results" field in the response');
        return left(MainFailure.serverFailure());
      }
    } else {
      print('HTTP Status Code: ${response.statusCode}');
      return left(MainFailure.serverFailure());
    }
  } catch (e) {
    print('Error: $e');
    return left(MainFailure.clientFailure());
  }
  } */

