// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Upcoming _$UpcomingFromJson(Map<String, dynamic> json) => Upcoming(
      posterPath: json['poster_path'] as String?,
      originalTitle: json['original_title'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$UpcomingToJson(Upcoming instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'original_title': instance.originalTitle,
      'backdrop_path': instance.backdropPath,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'id': instance.id,
    };
