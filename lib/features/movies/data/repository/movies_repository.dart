import 'package:either_dart/either.dart';
import 'package:movie_app/error/exceptions.dart';
import 'package:movie_app/features/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/domain/repository/base_movies_repository.dart';

class MoviesRepository extends BaseMoviesRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<ServerException , List<Movie>>> getNowPlaying({required int pageNumber}) async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies(pageNumber: pageNumber);
    try{
      return Right(result);

    } on ServerException catch(e){
      return Left(ServerException(errorMessageModel: e.errorMessageModel));
    }
  }


  @override
  Future<Either<ServerException, List<Movie>>> getPopularMovies({required int pageNumber}) async {

    final result = await baseMovieRemoteDataSource.getPopularMovies(pageNumber: pageNumber);
    try{
      return Right(result);

    } on ServerException catch(e){
      return Left(ServerException(errorMessageModel: e.errorMessageModel));
    }

  }

  @override
  Future<Either<ServerException, List<Movie>>> getTopRatedMovies({required int pageNumber}) async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies(pageNumber: pageNumber);
    try{
      return Right(result);

    } on ServerException catch(e){
      return Left(ServerException(errorMessageModel: e.errorMessageModel));
    }

  }



}