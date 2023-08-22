part of 'movies_bloc.dart';


class MoviesState {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<Movie> popularMovies;
  final List<Movie> popularOldMovies;
  final RequestState popularState;
  final String popularMessage;
  final bool popularFirstFetch;



  final List<Movie> topRatedMovies;
  final List<Movie> topRatedOldMovies;
  final RequestState topRatedState;
  final String topRatedMessage;
  final bool topRatedFirstFetch;

  MoviesState(
      {
        this.nowPlayingMovies =const [],
        this.nowPlayingState = RequestState.loading,
        this.nowPlayingMessage = '',
        this.popularMovies = const [],
        this.popularOldMovies = const [],
        this.popularState = RequestState.loading,
        this.popularMessage= '',
        this.popularFirstFetch = false,
        this.topRatedMovies = const [],
        this.topRatedOldMovies = const [],
        this.topRatedState = RequestState.loading,
        this.topRatedMessage = '',
        this.topRatedFirstFetch = false

      });

  MoviesState copyWith({
     List<Movie>? nowPlayingMovies,
     RequestState? nowPlayingState,
     String? nowPlayingMessage,


     List<Movie>? popularMovies,
     List<Movie>? popularOldMovies,
     RequestState? popularState,
     String? popularMessage,
     bool? popularFirstFetch,



     List<Movie>? topRatedMovies,
     List<Movie>? topRatedOldMovies,
     RequestState? topRatedState,
     String? topRatedMessage,
     bool? topRatedFirstFetch,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,

      popularMovies: popularMovies ?? this.popularMovies,
      popularOldMovies:  popularOldMovies ?? this.popularOldMovies,
      popularFirstFetch:  popularFirstFetch ?? this.popularFirstFetch,
      popularState:  popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,

      topRatedMovies:  topRatedMovies ?? this.topRatedMovies,
      topRatedOldMovies:  topRatedOldMovies ?? this.topRatedOldMovies,
      topRatedFirstFetch:  topRatedFirstFetch ?? this.topRatedFirstFetch,
      topRatedState:  topRatedState ?? this.topRatedState,
      topRatedMessage:  topRatedMessage ?? this.topRatedMessage,
    );
  }


}



