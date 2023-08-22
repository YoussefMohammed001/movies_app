import 'package:either_dart/either.dart';
import 'package:movie_app/error/exceptions.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/domain/repository/base_movies_repository.dart';

class GetNowPlayingMoviesUseCase{
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<Either<ServerException , List<Movie>>> execute({required int pageNumber}) async {
    return await baseMoviesRepository.getNowPlaying(pageNumber: pageNumber);
  }

 
}