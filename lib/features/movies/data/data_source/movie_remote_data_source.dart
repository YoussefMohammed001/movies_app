import 'package:dio/dio.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/error/exceptions.dart';
import 'package:movie_app/features/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>> getNowPlayingMovies({required int pageNumber});
  Future<List<MovieModel>> getPopularMovies({required int pageNumber});
  Future<List<MovieModel>> getTopRatedMovies({required int pageNumber});
}


class MovieRemoteDataSource extends BaseMovieRemoteDataSource{
  @override
Future<List<MovieModel>> getNowPlayingMovies({required int pageNumber}) async{
  final response = await Dio().get("${ApiConstants.baseUrl}movie/now_playing?language=en-US&page=$pageNumber",options: Options(
      headers: {
        'Authorization': ApiConstants.apiKey
      },
  ));
if(response.statusCode == 200){
return List<MovieModel>
    .from((response.data['results'] as List).map((e)
=> MovieModel.fromJson(e)
));
} else{
throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
}

}

  @override
  Future<List<MovieModel>> getPopularMovies({required int pageNumber}) async {
    final response = await Dio().get("${ApiConstants.baseUrl}movie/popular?language=en-US&page=$pageNumber",options: Options(
      headers: {
        'Authorization': ApiConstants.apiKey
      },
    ));
    if(response.statusCode == 200){
      return List<MovieModel>
          .from((response.data['results'] as List).map((e)
      => MovieModel.fromJson(e)
      ));
    } else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies({required int pageNumber}) async {
    final response = await Dio().get("${ApiConstants.baseUrl}movie/top_rated?language=en-US&page=$pageNumber",options: Options(
      headers: {
        'Authorization': ApiConstants.apiKey
      },
    ));
    if(response.statusCode == 200){
      return List<MovieModel>
          .from((response.data['results'] as List).map((e)
      => MovieModel.fromJson(e)
      ));
    } else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }



}