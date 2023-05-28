import 'package:dartz/dartz.dart';
import 'package:netflix/Domain/hot_and_new/model/everyones_watching/everyones_watching.dart';

import '../core/failures/main_failure.dart';

abstract class EveryonesWatchingServices {
  Future<Either<MainFailure, EveryonesWatching>> getPopular();
}
