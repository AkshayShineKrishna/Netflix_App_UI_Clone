// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_tv_shows.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopTvShows _$TopTvShowsFromJson(Map<String, dynamic> json) => TopTvShows(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => TopTvResultData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TopTvShowsToJson(TopTvShows instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

TopTvResultData _$TopTvResultDataFromJson(Map<String, dynamic> json) =>
    TopTvResultData(
      backdropPath: json['backdrop_path'] as String?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$TopTvResultDataToJson(TopTvResultData instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
    };
