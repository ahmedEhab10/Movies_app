import 'package:movies_app/core/data/Model/Move.dart';

class Data {
  final int? movieCount;
  final int? limit;
  final int? pageNumber;
  final List<Movies>? movies;

  Data({this.movieCount, this.limit, this.pageNumber, this.movies});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      movieCount: json['movie_count'],
      limit: json['limit'],
      pageNumber: json['page_number'],
      movies: json['movies'] != null
          ? (json['movies'] as List).map((i) => Movies.fromJson(i)).toList()
          : null,
    );
  }
}
