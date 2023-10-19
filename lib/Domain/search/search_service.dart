import 'package:dartz/dartz.dart';
import 'package:mynetflix/Domain/core/failures/main_failure.dart';
import 'package:mynetflix/Domain/search/model/search/search.dart';

abstract class SearchService {
  Future<Either<MainFailure, List<Search>>> searchMovies({
    required String movieQuery,
  });
}
