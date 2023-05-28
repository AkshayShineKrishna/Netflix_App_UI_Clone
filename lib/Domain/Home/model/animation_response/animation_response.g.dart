// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimationResponse _$AnimationResponseFromJson(Map<String, dynamic> json) =>
    AnimationResponse(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  AnimationResponseData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AnimationResponseToJson(AnimationResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

AnimationResponseData _$AnimationResponseDataFromJson(
        Map<String, dynamic> json) =>
    AnimationResponseData(
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$AnimationResponseDataToJson(
        AnimationResponseData instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
    };
