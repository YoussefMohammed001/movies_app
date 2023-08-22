import 'package:equatable/equatable.dart';
import 'package:movie_app/features/movies_details/domain/entities/genres.dart';

class MovieDetailsEntity extends Equatable {
  final String name, description, date, img;
  final double rate;
  final int id;
  final List<GenresEntities> genre;
  final bool adult;

  const MovieDetailsEntity( {
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.img,
    required this.rate,
    required this.genre,
    required this.adult,
  });

  @override
  List<Object> get props => [
        name,
        description,
        date,
        img,
        rate,
        genre,
        id,
    adult,
      ];
}
