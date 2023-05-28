import 'package:json_annotation/json_annotation.dart';

part 'released_past_year.g.dart';

@JsonSerializable()
class ReleasedPastYear {
  @JsonKey(name: 'results')
  List<ReleasedPastYearResult> results;

  ReleasedPastYear({this.results = const []});

  factory ReleasedPastYear.fromJson(Map<String, dynamic> json) {
    return _$ReleasedPastYearFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReleasedPastYearToJson(this);
}

@JsonSerializable()
class ReleasedPastYearResult {
  @JsonKey(name: 'poster_path')
  String? posterPath;

  ReleasedPastYearResult({
    this.posterPath,
  });

  factory ReleasedPastYearResult.fromJson(Map<String, dynamic> json) {
    return _$ReleasedPastYearResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReleasedPastYearResultToJson(this);
}
