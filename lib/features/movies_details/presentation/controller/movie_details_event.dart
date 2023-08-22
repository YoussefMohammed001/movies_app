part of 'movie_details_bloc.dart';

@immutable
abstract class BaseMovieDetailsEvent {


 const BaseMovieDetailsEvent();
}

class MovieDetailsEvent extends BaseMovieDetailsEvent{
 final String id;

 const MovieDetailsEvent({required this.id});
}

class RecommendationEvent extends BaseMovieDetailsEvent{
 final String id;

 const RecommendationEvent({required this.id});
}
