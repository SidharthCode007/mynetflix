import 'package:json_annotation/json_annotation.dart';

part 'upcoming.g.dart';

@JsonSerializable()
class Upcoming {
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

  Upcoming(
      {this.posterPath,
      this.originalTitle,
      this.backdropPath,
      this.overview,
      this.releaseDate,
      this.id});

  factory Upcoming.fromJson(Map<String, dynamic> json) {
    return _$UpcomingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpcomingToJson(this);
}
