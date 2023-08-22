import 'package:either_dart/src/either.dart';
import 'package:movie_app/error/exceptions.dart';
import 'package:movie_app/features/movies_details/data/data_source/movie_details_api.dart';
import 'package:movie_app/features/movies_details/domain/entities/movie_details_entite.dart';
import 'package:movie_app/features/movies_details/domain/entities/recommendtion.dart';
import 'package:movie_app/features/movies_details/domain/repository/movie_details_repository.dart';

 class MovieDetailsRepository extends BaseMovieDetailsRepository{
   final MovieDetailsApi movieDetailsApi;

   MovieDetailsRepository(this.movieDetailsApi);

  @override
  Future<Either<ServerException, MovieDetailsEntity>> getMovieDetails({required String id}) async {
    final result = await movieDetailsApi.getMovieDetails(id);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerException( errorMessageModel: failure.errorMessageModel));
    }

  }

  @override
  Future<Either<ServerException, List<RecommendationsEntity>>> getRecommendation({required String id,required String page}) async {
    final result = await movieDetailsApi.getRecommendation(id,page);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerException( errorMessageModel: failure.errorMessageModel));
    }

  }

}