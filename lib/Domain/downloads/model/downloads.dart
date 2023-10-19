import 'package:json_annotation/json_annotation.dart';

part 'downloads.g.dart';

@JsonSerializable()
class Downloads {
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  Downloads({this.posterPath, this.originalTitle, this.backdropPath});

  factory Downloads.fromJson(Map<String, dynamic> json) {
    return _$DownloadsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DownloadsToJson(this);
}
