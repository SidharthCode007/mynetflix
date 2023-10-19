import 'package:json_annotation/json_annotation.dart';

part 'everyonewatching.g.dart';

@JsonSerializable()
class Everyonewatching {
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  String? overview;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  String? id;

  Everyonewatching(
      {this.posterPath,
      this.originalTitle,
      this.backdropPath,
      this.overview,
      this.releaseDate,
      this.id});

  factory Everyonewatching.fromJson(Map<String, dynamic> json) {
    return _$EveryonewatchingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EveryonewatchingToJson(this);
}
