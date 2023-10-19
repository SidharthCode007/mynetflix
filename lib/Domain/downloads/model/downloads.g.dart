// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Downloads _$DownloadsFromJson(Map<String, dynamic> json) => Downloads(
      posterPath: json['poster_path'] as String?,
      originalTitle: json['original_title'] as String?,
      backdropPath: json['backdrop_path'] as String?,
    );

Map<String, dynamic> _$DownloadsToJson(Downloads instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'original_title': instance.originalTitle,
      'backdrop_path': instance.backdropPath,
    };
