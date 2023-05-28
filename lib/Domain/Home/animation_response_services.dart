import 'package:dartz/dartz.dart';
import 'package:netflix/Domain/Home/model/animation_response/animation_response.dart';

import '../core/failures/main_failure.dart';

abstract class AnimationResponseServices {
  Future<Either<MainFailure, AnimationResponse>> getAnimationData();
}
