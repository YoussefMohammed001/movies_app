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

class PopularComponent extends StatelessWidget {
  PopularComponent({super.key});

  final scrollController = ScrollController();

  void setUpScrollerController(context){
    scrollController.addListener(() {
      if(scrollController.position.atEdge){
        if(scrollController.position.pixels != 0){
          BlocProvider.of<MoviesBloc>(context).add(GetPopularEvent());
          print("end");
        }

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    setUpScrollerController(context);
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if(state.popularState == RequestState.loading
            && state.popularFirstFetch){
          return CircularProgressIndicator();
        }
        List<Movie> movies = [];
        bool isLoading = false;
        if(state.popularState == RequestState.loading){
          print("now playing loading");
          movies = state.popularOldMovies;
          isLoading = !isLoading;
          print(movies);
        } else if(state.popularState == RequestState.success){
          print("now playing SUCCESS");
          movies = state.popularMovies;
          print(movies);
        }
        return  Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      color: Colors.white,

                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      /// TODO : NAVIGATION TO POPULAR SCREEN
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return AllMoviesScreen(movies: state.popularMovies, title: 'Popular Movies',);
                      },));
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('See More', style: TextStyle(
                            color: Colors.white,

                          ),),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: Colors.white,


                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  controller: scrollController,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {

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
                            imageUrl: ApiConstants.imgUrl(movies[index].backDropPath),
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
