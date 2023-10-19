// ignore_for_file: unrelated_type_equality_checks

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mynetflix/Domain/core/api_endpoints.dart';
import 'package:mynetflix/Domain/core/failures/main_failure.dart';
import 'package:mynetflix/Domain/downloads/i_downloads_repo.dart';
import 'package:mynetflix/Domain/downloads/model/downloads.dart';

class DownloadsRepository implements IDownloadsRepo {
  @override
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.downloads);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList =
            (response.data['results'] as List).map((e) {
          return Downloads.fromJson(e);
        }).toList();
        return Right(downloadsList);
      } else {
        return Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return Left(MainFailure.clientFailure());
    }
  }
}
