import 'package:dio/dio.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/error/exceptions.dart';
import 'package:movie_app/features/movies_details/data/models/movie_details_model.dart';
import 'package:movie_app/features/movies_details/data/models/recommendation_model.dart';

class MovieDetailsApi{



  Future<MovieDetailsModel> getMovieDetails(String id) async {
    final response =
    await Dio().get("${ApiConstants.baseUrl}movie/$id?language=en-US",options: Options(
      headers: {
        'Authorization': ApiConstants.apiKey
      },

    ));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  Future<List<RecommendationModel>> getRecommendation(String id,String page) async {
    final response = await Dio().get("${ApiConstants.baseUrl}movie/$id/recommendations?language=en-US&page=$page"
        ,options: Options(
      headers: {
        'Authorization': ApiConstants.apiKey
      },

    ));

    if (response.statusCode == 200) {
      return List<RecommendationModel>
          .from((response.data['results'] as List).map((e)
      => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}