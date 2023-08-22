import 'package:movie_app/features/movies_details/domain/entities/genres.dart';

class GenreModel extends GenresEntities{
  GenreModel({required super.id, required super.name});

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(

  id: json['id'],
    name: json['name'],
  );
}