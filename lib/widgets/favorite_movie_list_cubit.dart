import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/cubit/movie_list_ui_state.dart';
import 'package:movie_app/cubit/popular_movie_cubit.dart';
import 'package:movie_app/models/popular_movie_response.dart';

import '../models/popular_movie_hive.dart';

class FavoriteMovieListCubit extends StatefulWidget {
  const FavoriteMovieListCubit({super.key});

  @override
  State<FavoriteMovieListCubit> createState() => _FavoriteMovieListCubitState();
}

class _FavoriteMovieListCubitState extends State<FavoriteMovieListCubit> {

  late Box<PopularMovieHive>_movieBox;

  late List<PopularMovie> _favouriteMovieList;

  @override
  void initState() {
    super.initState();
    context.read<PopularMovieCubit>().getPopularMovies();
    _movieBox=Hive.box('popular-movies');
    fetchFavouriteMovies();
  }
  void _saveMovie(PopularMovieHive movie){
    _movieBox.add(movie);
    fetchFavouriteMovies();
    print(_favouriteMovieList);
    setState(() {
    });
  }


  void fetchFavouriteMovies() async {
    final favouriteMovieHiveList=_movieBox.values.toList();
    _favouriteMovieList= favouriteMovieHiveList
        .map((movieHive) =>
            PopularMovie(title: movieHive.title, year: movieHive.year
    )).toList();

  }
  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //     itemCount: _popularMovieList.length,
    //     itemBuilder: ( context, index){
    //       return ListTile(
    //         title: Text(_popularMovieList[index].title ?? "No title"),
    //         subtitle: Text(_popularMovieList[index].year ?? "1999"),
    //       );
    //     }
    // );
    return BlocBuilder<PopularMovieCubit, UiState>(
        builder: (context, state) {
          return switch (state){
            Initial() => const Center(child: CircularProgressIndicator(),),
            Loading() => const Center(child: CircularProgressIndicator(),),
            Success() => ListView.builder(
              itemCount: state.movieList.length,

              itemBuilder: ( context, index){
                final movie=state.movieList[index];
                final isFavourite=_favouriteMovieList
                    .any((favouriteMovie) => favouriteMovie.title== movie.title);
                return ListTile(
                  title: Text(movie.title ?? "No title"),
                  subtitle: Text(movie.year ?? "1999"),
                  onTap:() {
                    final movieHive=PopularMovieHive(
                      title: movie.title,
                      year:movie.year,
                    );
                    _saveMovie(movieHive);
                  },
                  tileColor: isFavourite ? Colors.black12:Colors.white,
                );
              },
            ),
            Error() => const Center(child: Text('Something went wrong!'),),
          };
        }
    );

  }
}
