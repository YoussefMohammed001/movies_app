import 'package:either_dart/either.dart';
import 'package:movie_app/error/exceptions.dart';
import 'package:movie_app/features/movies_details/domain/entities/movie_details_entite.dart';
import 'package:movie_app/features/movies_details/domain/entities/recommendtion.dart';

abstract class BaseMovieDetailsRepository{

  Future<Either<ServerException , MovieDetailsEntity>>  getMovieDetails({required String id});
  Future<Either<ServerException , List<RecommendationsEntity>>>  getRecommendation({required String id,required String page});




}