import 'package:either_dart/either.dart';
import 'package:movie_app/error/exceptions.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository  {

  Future<Either<ServerException , List<Movie>>>  getNowPlaying({required int pageNumber});
  Future<Either<ServerException , List<Movie>>>  getPopularMovies({required int pageNumber});
  Future<Either<ServerException , List<Movie>>>  getTopRatedMovies({required int pageNumber});


}