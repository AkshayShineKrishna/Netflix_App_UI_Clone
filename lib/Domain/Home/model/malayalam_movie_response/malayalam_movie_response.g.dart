// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'malayalam_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MalayalamMovieResponse _$MalayalamMovieResponseFromJson(
        Map<String, dynamic> json) =>
    MalayalamMovieResponse(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => MalayalamMovieResponseData.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MalayalamMovieResponseToJson(
        MalayalamMovieResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

MalayalamMovieResponseData _$MalayalamMovieResponseDataFromJson(
        Map<String, dynamic> json) =>
    MalayalamMovieResponseData(
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$MalayalamMovieResponseDataToJson(
        MalayalamMovieResponseData instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
    };
