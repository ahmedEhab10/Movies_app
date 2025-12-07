import 'package:flutter/material.dart';

abstract class ConstanstManager {
  static List<String> avatarimages = [
    'assets/image/avatar1.png',
    'assets/image/avatar2.png',
    'assets/image/avatar3.png',
    'assets/image/avatar4.png',
    'assets/image/avatar5.png',
    'assets/image/avatar6.png',
    'assets/image/avatar7.png',
    'assets/image/avatar8.png',
    'assets/image/avatar9.png',
  ];
  static List<String> Genres = [
    'Documentary',
    'Comedy',
    'Romance',
    'Drama',
    'Crime',
    'Biography',
    'Action',
    'Animation',
    'History',
    'War',
    'Mystery',
    'Thriller',
    'Adventure',
    'Family',
    'Sci-Fi',
    'Fantasy',
    'Horror',
    'Adventure',
  ];

  static List<String> Movies_images = [
    'assets/image/Move_poser.png',
    'assets/image/Move_poser2.png',
    'assets/image/Move_poser3.png',
    'assets/image/Move_poser4.png',
    'assets/image/Move_poser5.png',
    'assets/image/Move_poser6.png',
    'assets/image/Move_poser7.png',
  ];

  static List<String> navbaritems = [
    'assets/svg/home_vector.svg',
    'assets/svg/search_vector.svg',
    'assets/svg/explore_vector.svg',
    'assets/svg/Profiel_vector.svg',
  ];
}

abstract class ApiConstants {
  static const String baseUrl = 'https://route-movie-apis.vercel.app/';
  static const String baseUrl2 = 'https://yts.lt/api/v2/';
  static const String allMovies = 'list_movies.json';
  static const String register = 'auth/register';
  static const String Login = 'auth/login';
  static const String profile = 'profile';
  static const String addtofavorites = 'favorites/add';
}

abstract class CachConstants {
  static const String token = 'token';
}
