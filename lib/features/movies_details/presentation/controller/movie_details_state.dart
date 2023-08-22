part of 'movie_details_bloc.dart';

@immutable
class MovieDetailsState extends Equatable{
  final MovieDetailsEntity? movieDetail;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;

  final List<RecommendationsEntity> recommendationsEntity;
  final List<RecommendationsEntity> oldRecommendationsEntity;
  final bool isRecommendedFirstFetch;
  final RequestState recommendationRequestState;
  final String recommendationMessage;

 const MovieDetailsState( {
   this.oldRecommendationsEntity = const [],
   this.isRecommendedFirstFetch = false,
   this.recommendationsEntity = const [],
   this.recommendationRequestState = RequestState.loading,
   this.recommendationMessage = "",
    this.movieDetail,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = "",
  });

  MovieDetailsState copyWith({

    MovieDetailsEntity? movieDetail,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,

     List<RecommendationsEntity>? recommendationsEntity,
     List<RecommendationsEntity>? oldRecommendationsEntity,
     bool? isRecommendedFirstFetch,

    RequestState? recommendationRequestState,
     String? recommendationMessage,

  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendationsEntity: recommendationsEntity ?? this.recommendationsEntity,
      oldRecommendationsEntity:  oldRecommendationsEntity ?? this.oldRecommendationsEntity,
      isRecommendedFirstFetch: isRecommendedFirstFetch ?? this.isRecommendedFirstFetch,
      recommendationRequestState:  recommendationRequestState ?? this.recommendationRequestState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,


    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    movieDetail,
    movieDetailsState,
    movieDetailsMessage,
  ];

}
