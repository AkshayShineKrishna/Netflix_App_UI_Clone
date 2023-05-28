import 'package:dartz/dartz.dart';

import '../core/failures/main_failure.dart';
import 'model/coming_soon/coming_soon.dart';

abstract class ComingSoonServices {
  Future<Either<MainFailure, ComingSoon>> getUpcoming();
}
