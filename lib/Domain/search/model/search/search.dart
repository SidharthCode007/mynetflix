import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';

@JsonSerializable()
class Search {
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  String? overview;
  @JsonKey(name: 'release_date')
  String? releaseDate;

  Search({
    this.posterPath,
    this.originalTitle,
    this.backdropPath,
    this.overview,
    this.releaseDate,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return _$SearchFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}
