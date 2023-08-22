
import 'package:either_dart/either.dart';
import 'package:movie_app/error/exceptions.dart';
import 'package:movie_app/features/movies_details/domain/entities/movie_details_entite.dart';
import 'package:movie_app/features/movies_details/domain/repository/movie_details_repository.dart';

class GetMovieDetailsUseCase {
  BaseMovieDetailsRepository baseMovieDetailsRepository;

  GetMovieDetailsUseCase(this.baseMovieDetailsRepository);

  Future<Either<ServerException, MovieDetailsEntity>> call({required String id}) async {
    return await baseMovieDetailsRepository.getMovieDetails(id: id);
  }


}
