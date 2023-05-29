// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'everyones_watching.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EveryonesWatching _$EveryonesWatchingFromJson(Map<String, dynamic> json) =>
    EveryonesWatching(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) =>
                  EveryonesWatchingData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EveryonesWatchingToJson(EveryonesWatching instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

EveryonesWatchingData _$EveryonesWatchingDataFromJson(
        Map<String, dynamic> json) =>
    EveryonesWatchingData(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      logoPath: json['logo_path'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      title: json['title'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$EveryonesWatchingDataToJson(
        EveryonesWatchingData instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'logo_path': instance.logoPath,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'title': instance.title,
      'key': instance.key,
    };
