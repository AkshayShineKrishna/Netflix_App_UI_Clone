import 'package:dartz/dartz.dart';
import 'package:netflix/Domain/Downloads/models/downloads.dart';
import 'package:netflix/Domain/core/failures/main_failure.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
