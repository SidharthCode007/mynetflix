class Movie {
  final int? id;
  final String? backdropPath;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? releaseDate;
  final String? title;


  Movie({
    required this.id,
    required this.backdropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
    );
  }
}

class MovieResponse {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      page: json['page'],
      results: List<Movie>.from(
          json['results'].map((movie) => Movie.fromJson(movie))),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
