import 'package:json_annotation/json_annotation.dart';
part 'coming_soon.g.dart';

@JsonSerializable()
class ComingSoon {
  @JsonKey(name: 'results')
  List<ComingSoonData> results;

  ComingSoon({
    this.results = const [],
  });

  factory ComingSoon.fromJson(Map<String, dynamic> json) {
    return _$ComingSoonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ComingSoonToJson(this);
}

@JsonSerializable()
class ComingSoonData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'logo_path')
  String? logoPath;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'month')
  String? month;
  @JsonKey(name: 'day')
  String? day;
  @JsonKey(name: 'key')
  String? key;

  ComingSoonData({
    this.backdropPath,
    this.id,
    this.logoPath,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.title,
    this.month,
    this.day,
    this.key,
  });

  factory ComingSoonData.fromJson(Map<String, dynamic> json) {
    return _$ComingSoonDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ComingSoonDataToJson(this);
}
