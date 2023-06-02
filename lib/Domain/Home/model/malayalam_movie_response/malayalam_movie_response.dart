import 'package:json_annotation/json_annotation.dart';

part 'malayalam_movie_response.g.dart';

@JsonSerializable()
class MalayalamMovieResponse {
  List<MalayalamMovieResponseData> results;

  MalayalamMovieResponse({this.results = const []});

  factory MalayalamMovieResponse.fromJson(Map<String, dynamic> json) {
    return _$MalayalamMovieResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MalayalamMovieResponseToJson(this);
}

@JsonSerializable()
class MalayalamMovieResponseData {
  @JsonKey(name: 'poster_path')
  String? posterPath;

  MalayalamMovieResponseData({
    this.posterPath,
  });

  factory MalayalamMovieResponseData.fromJson(Map<String, dynamic> json) {
    return _$MalayalamMovieResponseDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MalayalamMovieResponseDataToJson(this);
}
