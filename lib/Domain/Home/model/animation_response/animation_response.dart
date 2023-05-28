import 'package:json_annotation/json_annotation.dart';

part 'animation_response.g.dart';

@JsonSerializable()
class AnimationResponse {
  @JsonKey(name: 'results')
  List<AnimationResponseData> results;

  AnimationResponse({this.results = const []});

  factory AnimationResponse.fromJson(Map<String, dynamic> json) {
    return _$AnimationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnimationResponseToJson(this);
}

@JsonSerializable()
class AnimationResponseData {
  @JsonKey(name: 'poster_path')
  String? posterPath;

  AnimationResponseData({
    this.posterPath,
  });

  factory AnimationResponseData.fromJson(Map<String, dynamic> json) {
    return _$AnimationResponseDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AnimationResponseDataToJson(this);
}
