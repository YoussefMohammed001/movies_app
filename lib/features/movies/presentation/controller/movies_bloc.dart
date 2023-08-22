import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/core/utils/request_state.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movie_app/features/movies/domain/usecase/get_popular_movies.dart';
import 'package:movie_app/features/movies/domain/usecase/get_top_rated_movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetNowTopRatedMoviesUseCase getNowTopRatedMoviesUseCase;
  int page = 1;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getNowTopRatedMoviesUseCase) : super(MoviesState()) {
    on<GetNowPlayingEvent>(_getNowPlaying);
    on<GetPopularEvent>(_getPopularMovies);
     on<GetTopRatedEvents>(_getTopMovies);


  }

  Future<void> _getNowPlaying(GetNowPlayingEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase.execute(pageNumber: 1);

    result.fold((left) {
      emit(state.copyWith(
        nowPlayingState: RequestState.failure,
        nowPlayingMessage: left.errorMessageModel.statusMessage,
      ));
    }, (right) {
      print(" now playing ===========>${right}");

      emit(state.copyWith(
        nowPlayingState: RequestState.success,
        nowPlayingMovies: right,
      ));
    });
  }


  Future<void> _getPopularMovies(GetPopularEvent event, Emitter<MoviesState> emit) async {


 final currentState = state;
 print('object');
 var oldMovies = <Movie>[];

 if(state.popularState == RequestState.success){
oldMovies = currentState.popularMovies;
 }

 emit(
     state.copyWith(
       popularOldMovies: oldMovies,
   popularFirstFetch: page == 1,
   popularState:  RequestState.loading,
 )
 );

  final result = await getPopularMoviesUseCase.execute(pageNumber: page);
  result.fold((left) {
print("leeeeeeeeeft"+ left.toString());
  }, (right) {
    page ++;
    final posts = state.popularOldMovies;
posts.addAll(right);
print("a7a=-======> $posts");
    emit(
        state.copyWith(
          popularMovies: posts,
          popularState:  RequestState.success,
        )
    );
  });



  }



  Future<void> _getTopMovies(GetTopRatedEvents event, Emitter<MoviesState> emit) async {


    final currentState = state;
    print('object');
    var oldMovies = <Movie>[];

    if(state.topRatedState == RequestState.success){
      oldMovies = currentState.topRatedMovies;
    }

    emit(
        state.copyWith(
          topRatedOldMovies: oldMovies,
          topRatedFirstFetch: page == 1,
          topRatedState:  RequestState.loading,
        )
    );

    final result = await getNowTopRatedMoviesUseCase.execute(pageNumber: page);
    result.fold((left) {
      print("leeeeeeeeeft"+ left.toString());
    }, (right) {
      page ++;
      final movies = state.topRatedOldMovies;
      movies.addAll(right);
      print("=-======> $movies");
      emit(
          state.copyWith(
            topRatedMovies: movies,
            topRatedState:  RequestState.success,
          )
      );
    });



  }
}