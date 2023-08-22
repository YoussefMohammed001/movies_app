import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/core/utils/request_state.dart';
import 'package:movie_app/features/movies/domain/entities/movie.dart';
import 'package:movie_app/features/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_app/features/movies/presentation/screens/all_movies_screen.dart';
import 'package:movie_app/features/movies_details/presentation/screens/movie_details_screen.dart';
import 'package:shimmer/shimmer.dart';
class TopRatedComponent extends StatelessWidget {
   TopRatedComponent({super.key});
  final scrollController = ScrollController();

  void setUpScrollerController(context){
    scrollController.addListener(() {
      if(scrollController.position.atEdge){
        if(scrollController.position.pixels != 0){
          BlocProvider.of<MoviesBloc>(context).add(GetTopRatedEvents());
          print("end");
        }

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setUpScrollerController(context);
return BlocBuilder<MoviesBloc,MoviesState>(builder:  (context, state) {

  if(state.topRatedState == RequestState.loading
      && state.topRatedFirstFetch){
    return CircularProgressIndicator();
  }
  List<Movie> movies = [];
  bool isLoading = false;
  if(state.topRatedState == RequestState.loading){
    print("now playing loading");
    movies = state.topRatedOldMovies;
    isLoading = !isLoading;
    print(movies);
  }
  else if(state.topRatedState == RequestState.success){
    print("now playing SUCCESS");
    movies = state.topRatedMovies;
    print(movies);
  }
  return  Column(
    children: [

      FadeIn(
        duration: const Duration(milliseconds: 500),
        child: SizedBox(
          height: 170.0,
          child: ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: movies.length + (isLoading ? 1 : 0),
            itemBuilder: (context, index) {
                 if(index < movies.length) {
                   return Container(
                     padding: const EdgeInsets.only(right: 8.0),
                     child: InkWell(

                       onTap: () {
                         /// TODO : NAVIGATE TO  MOVIE DETAILS
                         Navigator.push(
                             context,
                             MaterialPageRoute(builder:
                                 (context) =>
                                 MovieDetailsScreen
                                   (id: movies[index].id.toString(),),));
                       },
                       child: ClipRRect(
                         borderRadius:
                         const BorderRadius.all(Radius.circular(8.0)),
                         child: CachedNetworkImage(
                           width: 120.0,
                           fit: BoxFit.cover,
                           imageUrl: ApiConstants.imgUrl(
                               movies[index].backDropPath),
                           placeholder: (context, url) =>
                               Shimmer.fromColors(
                                 baseColor: Colors.grey[850]!,
                                 highlightColor: Colors.grey[800]!,
                                 child: Container(
                                   height: 170.0,
                                   width: 120.0,
                                   decoration: BoxDecoration(
                                     color: Colors.black,
                                     borderRadius: BorderRadius.circular(8.0),
                                   ),
                                 ),
                               ),
                           errorWidget: (context, url, error) =>
                           const Icon(Icons.error),
                         ),
                       ),
                     ),
                   );
                 } else {
                   Timer(Duration(milliseconds: 30), () {
                     scrollController
                         .jumpTo(scrollController.position.maxScrollExtent);
                   });

                   return CircularProgressIndicator();
                 }




            },
          ),
        ),
      ),
    ],
  );




},
);
  }
}
