import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/features/movies/presentation/components/now_playing_component.dart';
import 'package:movie_app/features/movies/presentation/components/popular_component.dart';
import 'package:movie_app/features/movies/presentation/components/top_rated_component.dart';
import 'package:movie_app/features/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_app/features/movies/presentation/screens/all_movies_screen.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {

        return MoviesBloc(sl(),sl(),sl())..add(GetNowPlayingEvent())..add(GetPopularEvent())..add(GetTopRatedEvents());
      },

      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          NowPlayingComponent(),


               PopularComponent(),


              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",

                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        color: Colors.white,

                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
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
              TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
