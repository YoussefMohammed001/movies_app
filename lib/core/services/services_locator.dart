import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app/features/movies/data/repository/movies_repository.dart';
import 'package:movie_app/features/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/features/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movie_app/features/movies/domain/usecase/get_popular_movies.dart';
import 'package:movie_app/features/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:movie_app/features/movies_details/data/data_source/movie_details_api.dart';
import 'package:movie_app/features/movies_details/data/repository/movie_details_repository.dart';
import 'package:movie_app/features/movies_details/domain/repository/movie_details_repository.dart';
import 'package:movie_app/features/movies_details/domain/usecase/movie_details_use_case.dart';
import 'package:movie_app/features/movies_details/domain/usecase/recommendation_use_case.dart';

final sl = GetIt.instance;
class ServicesLocator{
  void init (){

    ///UseCase
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetNowTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton(() => RecommendationUseCse(sl()));



    ///Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
    sl.registerLazySingleton<BaseMovieDetailsRepository>(() => MovieDetailsRepository(sl()));


    ///Data SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    sl.registerLazySingleton(() => MovieDetailsApi());





  }
}