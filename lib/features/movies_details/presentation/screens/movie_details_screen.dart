import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/utils/request_state.dart';
import 'package:movie_app/features/movies_details/domain/entities/genres.dart';
import 'package:movie_app/features/movies_details/presentation/components/movie_details_component.dart';
import 'package:movie_app/features/movies_details/presentation/components/recommendation.dart';
import 'package:movie_app/features/movies_details/presentation/controller/movie_details_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailsScreen extends StatelessWidget {
   MovieDetailsScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MovieDetailsBloc(sl(), sl())
          ..add(MovieDetailsEvent(id: id))
          ..add(RecommendationEvent(id: id));
      },
      lazy: false,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            switch (state.movieDetailsState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.success:
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieDetailsComponent(),

                      RecommendationComponent(),
                    ],
                  ),
                );
              case RequestState.failure:
                return Container();
            }
          },
        ),
      ),
    );
  }

}
