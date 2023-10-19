// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'everyonewatching.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Everyonewatching _$EveryonewatchingFromJson(Map<String, dynamic> json) =>
    Everyonewatching(
      posterPath: json['poster_path'] as String?,
      originalTitle: json['original_title'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$EveryonewatchingToJson(Everyonewatching instance) =>
    <String, dynamic>{
      'poster_path': instance.posterPath,
      'original_title': instance.originalTitle,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'id': instance.id,
    };
