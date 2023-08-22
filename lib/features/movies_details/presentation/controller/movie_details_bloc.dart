import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/utils/request_state.dart';
import 'package:movie_app/features/movies_details/domain/entities/movie_details_entite.dart';
import 'package:movie_app/features/movies_details/domain/entities/recommendtion.dart';
import 'package:movie_app/features/movies_details/domain/usecase/movie_details_use_case.dart';
import 'package:movie_app/features/movies_details/domain/usecase/recommendation_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<BaseMovieDetailsEvent, MovieDetailsState> {

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.recommendationUseCse) : super(MovieDetailsState()) {

    on<MovieDetailsEvent>(_getMovieDetails);
    on<RecommendationEvent>(_getRecommendation);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final RecommendationUseCse recommendationUseCse;

  FutureOr<void> _getMovieDetails(MovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(id: event.id);

    result.fold(
          (l) => emit(state.copyWith(
        movieDetailsState: RequestState.failure,
        movieDetailsMessage: l.errorMessageModel.statusMessage,
      )),
          (r) {
            print(r);

            emit(
              state.copyWith(
                movieDetail: r,
                movieDetailsState: RequestState.success,
              ),
            );
          }
    );

  }
  FutureOr<void> _getRecommendation(RecommendationEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await recommendationUseCse(id: event.id,page: 1.toString());

    result.fold(
          (l) => emit(state.copyWith(
        recommendationRequestState: RequestState.failure,
        movieDetailsMessage: l.errorMessageModel.statusMessage,
      )),
          (r) {
            print(r);

            emit(
              state.copyWith(
                recommendationsEntity: r,
                recommendationRequestState: RequestState.success,
              ),
            );
          }
    );

  }


}
