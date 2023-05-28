// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'released_past_year.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleasedPastYear _$ReleasedPastYearFromJson(Map<String, dynamic> json) =>
    ReleasedPastYear(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  ReleasedPastYearResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ReleasedPastYearToJson(ReleasedPastYear instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ReleasedPastYearResult _$ReleasedPastYearResultFromJson(
        Map<String, dynamic> json) =>
    ReleasedPastYearResult(
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$ReleasedPastYearResultToJson(
        ReleasedPastYearResult instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
    };
