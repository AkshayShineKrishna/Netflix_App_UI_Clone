import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/core/api_endpoints.dart';
import 'package:netflix/Domain/core/failures/main_failure.dart';
import 'package:netflix/Domain/search/model/search_response.dart';
import 'package:netflix/Domain/search/search_services.dart';

@LazySingleton(as: SearchServices)
class SearchImpl implements SearchServices {
  @override
  Future<Either<MainFailure, SearchResponse>> searchMedia(
      {required String mediaQuery}) async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.search, queryParameters: {
        'query': mediaQuery,
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);
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
