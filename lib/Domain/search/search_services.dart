import 'package:dartz/dartz.dart';

import '../core/failures/main_failure.dart';
import 'model/search_response.dart';

abstract class SearchServices {
  Future<Either<MainFailure, SearchResponse>> searchMedia({
    required String mediaQuery,
  });
}
