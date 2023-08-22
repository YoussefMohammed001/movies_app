import 'package:movie_app/features/movies_details/domain/entities/recommendtion.dart';

class RecommendationModel extends RecommendationsEntity{
  const RecommendationModel({required super.backDropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String,dynamic> json) => RecommendationModel(
    id: json['id'],
    backDropPath: json["backdrop_path"] ?? '/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg',



  );


}