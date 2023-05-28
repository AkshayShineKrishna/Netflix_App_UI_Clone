import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix/Domain/core/failures/main_failure.dart';

import 'package:netflix/Domain/hot_and_new/model/coming_soon/coming_soon.dart';

import '../../Domain/core/api_endpoints.dart';
import '../../Domain/hot_and_new/coming_soon_services.dart';

@LazySingleton(as: ComingSoonServices)
class ComingSoonImpl implements ComingSoonServices {
  @override
  Future<Either<MainFailure, ComingSoon>> getUpcoming() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.upcomingMovie);
      log('upcoming');
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = ComingSoon.fromJson(response.data);
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
