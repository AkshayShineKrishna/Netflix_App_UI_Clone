import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix/Domain/Home/model/release_past_year/released_past_year.dart';

import 'package:netflix/Domain/core/failures/main_failure.dart';
import '../../Domain/Home/released_past_year_services.dart';
import '../../Domain/core/api_endpoints.dart';

@LazySingleton(as: ReleasedPastYearServices)
class ReleasedPastYearImpl implements ReleasedPastYearServices {
  @override
  Future<Either<MainFailure, ReleasedPastYear>> getReleasedPastYear() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.releasedInPast);
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = ReleasedPastYear.fromJson(response.data);
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
