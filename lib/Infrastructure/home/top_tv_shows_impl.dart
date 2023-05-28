import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/Home/model/top_tv_shows.dart';
import 'package:netflix/Domain/Home/top_tv_show_services.dart';
import 'package:netflix/Domain/core/failures/main_failure.dart';

import '../../Domain/core/api_endpoints.dart';

@LazySingleton(as: TopTvShowsServices)
class TopTvShowImpl implements TopTvShowsServices {
  @override
  Future<Either<MainFailure, TopTvShows>> getTopTV() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.tvShows);
      log('Top 10 Tv shows');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = TopTvShows.fromJson(response.data);
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
