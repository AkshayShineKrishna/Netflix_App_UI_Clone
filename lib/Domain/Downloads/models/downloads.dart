// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'downloads.freezed.dart';
part 'downloads.g.dart';

@freezed
class Downloads with _$Downloads {
  const factory Downloads(
      {@JsonKey(name: 'title') required String? title,
      @JsonKey(name: 'name') required String? name,
      @JsonKey(name: 'backdrop_path') required String? backdropPath,
      @JsonKey(name: 'poster_path') required String? posterPath}) = _Downloads;

  factory Downloads.fromJson(Map<String, dynamic> json) =>
      _$DownloadsFromJson(json);
}
