import 'package:json_annotation/json_annotation.dart';

part 'top_tv_shows.g.dart';

@JsonSerializable()
class TopTvShows {
  @JsonKey(name: 'results')
  List<TopTvResultData> results;

  TopTvShows({
    this.results = const [],
  });

  factory TopTvShows.fromJson(Map<String, dynamic> json) {
    return _$TopTvShowsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopTvShowsToJson(this);
}

@JsonSerializable()
class TopTvResultData {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  TopTvResultData({
    this.backdropPath,
    this.name,
    this.overview,
    this.posterPath,
  });

  factory TopTvResultData.fromJson(Map<String, dynamic> json) {
    return _$TopTvResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopTvResultDataToJson(this);
}
