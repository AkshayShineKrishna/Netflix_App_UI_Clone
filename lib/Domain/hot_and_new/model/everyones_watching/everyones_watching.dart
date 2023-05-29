import 'package:json_annotation/json_annotation.dart';

part 'everyones_watching.g.dart';

@JsonSerializable()
class EveryonesWatching {
  @JsonKey(name: 'results')
  List<EveryonesWatchingData> results;

  EveryonesWatching({this.results = const []});

  factory EveryonesWatching.fromJson(Map<String, dynamic> json) {
    return _$EveryonesWatchingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EveryonesWatchingToJson(this);
}

@JsonSerializable()
class EveryonesWatchingData {
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
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'key')
  String? key;

  EveryonesWatchingData({
    this.backdropPath,
    this.id,
    this.logoPath,
    this.originalTitle,
    this.overview,
    this.title,
    this.key,
  });

  factory EveryonesWatchingData.fromJson(Map<String, dynamic> json) {
    return _$EveryonesWatchingDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EveryonesWatchingDataToJson(this);
}
