import 'package:dartz/dartz.dart';

import '../core/failures/main_failure.dart';
import 'model/release_past_year/released_past_year.dart';

abstract class ReleasedPastYearServices {
  Future<Either<MainFailure, ReleasedPastYear>> getReleasedPastYear();
}
