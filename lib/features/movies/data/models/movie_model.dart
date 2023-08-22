
import 'package:movie_app/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.title,
      required super.id,
      required super.releaseDate,
      required super.backDropPath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage});


  factory MovieModel.fromJson(Map<String,dynamic> json) => MovieModel(
    title: json['title'],
      id: json['id'],
    backDropPath: json['backdrop_path'],
      releaseDate: json['release_date'],

      genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      voteAverage: json['vote_average'].toDouble(),
  );


}
