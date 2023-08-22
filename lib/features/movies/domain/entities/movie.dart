import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String backDropPath;
  final String title;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  const Movie(
      {
        required this.title,
        required this.id,
        required this.releaseDate,
      required this.backDropPath,
      required this.genreIds,
      required this.overview,
      required this.voteAverage});

  @override
  List<Object> get props => [
        id,
        backDropPath,
        genreIds,
        overview,
        voteAverage,
        releaseDate,
    title
      ];
}
