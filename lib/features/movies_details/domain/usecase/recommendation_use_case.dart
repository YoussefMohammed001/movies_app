import 'package:either_dart/either.dart';
import 'package:movie_app/error/exceptions.dart';
import 'package:movie_app/features/movies_details/domain/entities/recommendtion.dart';
import 'package:movie_app/features/movies_details/domain/repository/movie_details_repository.dart';

 class RecommendationUseCse{
  BaseMovieDetailsRepository baseMovieDetailsRepository;

  RecommendationUseCse(this.baseMovieDetailsRepository);

  Future<Either<ServerException,List< RecommendationsEntity>>> call({required String id,required String page}) async {
    return await baseMovieDetailsRepository.getRecommendation(id: id, page: page);
  }


}