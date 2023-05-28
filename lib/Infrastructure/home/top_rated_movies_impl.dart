import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix/Domain/core/failures/main_failure.dart';

import '../../Domain/Home/model/top_rated_movies/top_rated_movies.dart';
import '../../Domain/Home/top_rated_services.dart';
import '../../Domain/core/api_endpoints.dart';

@LazySingleton(as: TopRatedServices)
class TopRatedMoviesImpl implements TopRatedServices {
  @override
  Future<Either<MainFailure, TopRatedMovies>> getTopRatedMovies() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.topRated);
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = TopRatedMovies.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
