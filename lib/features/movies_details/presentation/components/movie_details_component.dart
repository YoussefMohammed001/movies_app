import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/network/api_constants.dart';
import 'package:movie_app/core/utils/request_state.dart';
import 'package:movie_app/features/movies_details/domain/entities/genres.dart';
import 'package:movie_app/features/movies_details/presentation/controller/movie_details_bloc.dart';

class MovieDetailsComponent extends StatelessWidget {
  const MovieDetailsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {

        switch (state.movieDetailsState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.success:

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: Image.network(
                        ApiConstants.imgUrl(
                          state.movieDetail!.img,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          state.movieDetail!.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ),
                      Visibility(
                        visible: state.movieDetail!.adult == true,
                        child: const Text(
                          "+18",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[800],
                            borderRadius: BorderRadius.circular(7)),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            state.movieDetail!.date,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      state.movieDetail!.rate.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    state.movieDetail!.description.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Genres:",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(" ${_showGenres(state.movieDetail!.genre)}",
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "More Like This",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );


          case RequestState.failure:
            return Container();
        }
      },
    );


  }

  String _showGenres(List<GenresEntities> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
