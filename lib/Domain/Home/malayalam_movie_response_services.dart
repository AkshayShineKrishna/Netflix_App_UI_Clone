import 'package:dartz/dartz.dart';
import 'package:netflix/Domain/Home/model/malayalam_movie_response/malayalam_movie_response.dart';

import '../core/failures/main_failure.dart';

abstract class MalayalamMovieService {
  Future<Either<MainFailure, MalayalamMovieResponse>> getMalayalamMovies();
}