part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent {

const  MoviesEvent();
}

class GetNowPlayingEvent extends MoviesEvent{}
class GetPopularEvent extends MoviesEvent{}
class GetTopRatedEvents extends MoviesEvent{}
