class FavoriteMovieModel {
  final String movieId;
  final String name;
  final double rating;
  final String imageURL;
  final String year;

  FavoriteMovieModel({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageURL,
    required this.year,
  });

  factory FavoriteMovieModel.fromJson(Map<String, dynamic> json) {
    return FavoriteMovieModel(
      movieId: json['movieId'],
      name: json['name'],
      rating: (json['rating'] as num).toDouble(),
      imageURL: json['imageURL'],
      year: json['year'],
    );
  }
}
