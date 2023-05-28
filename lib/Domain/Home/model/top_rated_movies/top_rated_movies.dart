import 'package:json_annotation/json_annotation.dart';

part 'top_rated_movies.g.dart';

@JsonSerializable()
class TopRatedMovies {
  @JsonKey(name: 'results')
  List<TopRatedResult> results;

  TopRatedMovies({
    this.results = const [],
  });

  factory TopRatedMovies.fromJson(Map<String, dynamic> json) {
    return _$TopRatedMoviesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopRatedMoviesToJson(this);
}

@JsonSerializable()
class TopRatedResult {
  @JsonKey(name: 'poster_path')
  String? posterPath;

  TopRatedResult({
    this.posterPath,
  });

  factory TopRatedResult.fromJson(Map<String, dynamic> json) {
    return _$TopRatedResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopRatedResultToJson(this);
}
