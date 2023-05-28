import 'package:dartz/dartz.dart';

import '../core/failures/main_failure.dart';
import 'model/top_tv_shows.dart';

abstract class TopTvShowsServices {
  Future<Either<MainFailure, TopTvShows>> getTopTV();
}
