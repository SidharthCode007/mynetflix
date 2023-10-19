import 'package:mynetflix/core/url.dart';

class ApiEndPoints {
  static const downloads = "$baseUrl/trending/all/day?api_key=$apiKey";
  static const search = '$baseUrl/search/movie?api_key=$apiKey&query=';
  static const upcoming = '$baseUrl/movie/upcoming?api_key=$apiKey';
  static const everyoneswatching = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const homeMovieUrl = "$baseUrl/discover/movie?api_key=$apiKey";
  static const homeTvUrl = "$baseUrl/discover/tv?api_key=$apiKey";
}
