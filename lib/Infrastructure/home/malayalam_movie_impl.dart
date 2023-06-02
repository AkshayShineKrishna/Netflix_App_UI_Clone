import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/Home/malayalam_movie_response_services.dart';
import 'package:netflix/Domain/Home/model/malayalam_movie_response/malayalam_movie_response.dart';
import 'package:netflix/Domain/core/failures/main_failure.dart';

import '../../Domain/core/api_endpoints.dart';

@LazySingleton(as: MalayalamMovieService)
class MalayalamMovieImpl implements MalayalamMovieService{
  @override
  Future<Either<MainFailure, MalayalamMovieResponse>> getMalayalamMovies() async{
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.malayalamMovies);
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = MalayalamMovieResponse.fromJson(response.data);
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