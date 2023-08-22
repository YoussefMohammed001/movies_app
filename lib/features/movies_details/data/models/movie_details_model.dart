import 'package:movie_app/features/movies_details/data/models/genre_model.dart';
import 'package:movie_app/features/movies_details/domain/entities/movie_details_entite.dart';

class MovieDetailsModel extends MovieDetailsEntity {
  MovieDetailsModel(
      {required super.name,
      required super.description,
      required super.date,
      required super.img,
      required super.rate,
      required super.genre, required super.id, required super.adult});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        name: json['title'],
        description: json['overview'],
        date: json['release_date'],
        img: json['backdrop_path'],
        rate: json['vote_average'],
        genre: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
        id: json['id'], adult: json['adult'],
      );
}
