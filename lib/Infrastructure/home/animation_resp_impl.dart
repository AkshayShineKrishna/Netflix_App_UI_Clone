import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:netflix/Domain/Home/model/animation_response/animation_response.dart';

import 'package:netflix/Domain/core/failures/main_failure.dart';

import '../../Domain/Home/animation_response_services.dart';

import '../../Domain/core/api_endpoints.dart';

@LazySingleton(as: AnimationResponseServices)
class AnimationResponseImpl implements AnimationResponseServices {
  @override
  Future<Either<MainFailure, AnimationResponse>> getAnimationData() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.animationGenre);
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = AnimationResponse.fromJson(response.data);
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
