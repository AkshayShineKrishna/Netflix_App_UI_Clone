import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix/Domain/core/failures/main_failure.dart';

import 'package:netflix/Domain/hot_and_new/model/everyones_watching/everyones_watching.dart';

import '../../Domain/core/api_endpoints.dart';
import '../../Domain/hot_and_new/everyones_watching_services.dart';

@LazySingleton(as: EveryonesWatchingServices)
class EveryonesWatchingImpl implements EveryonesWatchingServices {
  @override
  Future<Either<MainFailure, EveryonesWatching>> getPopular() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.popularMovie);
      log('popular');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = EveryonesWatching.fromJson(response.data);
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
