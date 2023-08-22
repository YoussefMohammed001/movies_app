import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/core/utils/request_state.dart';
import 'package:movie_app/features/movies_details/domain/entities/genres.dart';
import 'package:movie_app/features/movies_details/presentation/controller/movie_details_bloc.dart';
import 'package:movie_app/features/movies_details/presentation/screens/movie_details_screen.dart';
import 'package:shimmer/shimmer.dart';

class RecommendationComponent extends StatelessWidget {
   RecommendationComponent({super.key});
  List<GenresEntities>? genres;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {

      switch (state.recommendationRequestState) {
        case RequestState.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );
        case RequestState.success:
          genres = state.movieDetail!.genre;
          return GridView.builder(
            padding: const EdgeInsets.all(0),

            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.recommendationsEntity.length,
            itemBuilder: (context, index) {
              final recommendation =
              state.recommendationsEntity[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MovieDetailsScreen(id: recommendation.id.toString());
                  },));
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),

                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(10.0)),
                      child: CachedNetworkImage(
                        imageUrl: ApiConstants.imgUrl(
                            recommendation.backDropPath),
                        placeholder: (context, url) =>
                            Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                  BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                        height: 180.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
          );


        case RequestState.failure:
          return Container();
      }
    });
  }
}
