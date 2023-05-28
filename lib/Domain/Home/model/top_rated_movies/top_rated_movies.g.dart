// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedMovies _$TopRatedMoviesFromJson(Map<String, dynamic> json) =>
    TopRatedMovies(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => TopRatedResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TopRatedMoviesToJson(TopRatedMovies instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

TopRatedResult _$TopRatedResultFromJson(Map<String, dynamic> json) =>
    TopRatedResult(
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$TopRatedResultToJson(TopRatedResult instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
    };
