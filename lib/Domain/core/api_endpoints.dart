import 'package:netflix/Core/strings.dart';

import '../../Infrastructure/api_key.dart';

class ApiEndPoints {
  //search trending
  static const downloads = '$baseUrl/trending/all/day?api_key=$apiKey';
  //search both movies and TV
  static const search = '$baseUrl/search/multi?api_key=$apiKey';
  //logo Movie
  static const movieLogo = '$baseUrl/movie/id/images?api_key=$apiKey';
  //logo TV
  static const tvLogo = '$baseUrl/tv/id/images?api_key=$apiKey';
  //Top Tv shows
  static const tvShows = '$baseUrl/trending/tv/day?api_key=$apiKey';
  //Top Rated Movies
  static const topRated = '$baseUrl/movie/top_rated?api_key=$apiKey';
  //Released in the Past
  static const releasedInPast =
      '$baseUrl/discover/movie?api_key=$apiKey&primary_release_date.gte=2015-01-01&primary_release_date.lte=2022-12-31&region=in';
  //animation genre
  static const animationGenre =
      '$baseUrl/discover/movie?api_key=$apiKey&with_genres=16';
  //custom api - gets upcoming movie details and logo
  static const upcomingMovie =
      'https://cybertron.pythonanywhere.com/get_filepaths';
  //custom api - get popular movies detail and logos
  static const popularMovie =
      'https://cybertron.pythonanywhere.com/get_popular';
}
