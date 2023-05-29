// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coming_soon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComingSoon _$ComingSoonFromJson(Map<String, dynamic> json) => ComingSoon(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => ComingSoonData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ComingSoonToJson(ComingSoon instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComingSoonData _$ComingSoonDataFromJson(Map<String, dynamic> json) =>
    ComingSoonData(
      backdropPath: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      logoPath: json['logo_path'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      title: json['title'] as String?,
      month: json['month'] as String?,
      day: json['day'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$ComingSoonDataToJson(ComingSoonData instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'id': instance.id,
      'logo_path': instance.logoPath,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'month': instance.month,
      'day': instance.day,
      'key': instance.key,
    };
