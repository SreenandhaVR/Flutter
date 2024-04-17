import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_list_ui_state.dart';
import '../models/popular_movie_response.dart';

class FavouriteCubit extends Cubit<UiState> {
  FavouriteCubit() : super(Initial());

  void getPopularMovies() async {
    emit(Loading());
    final popularMovieList =  fetchFavouriteMovies();
    if (popularMovieList is List<PopularMovie>) {
      emit(Success(popularMovieList));
    } else {
      emit(Error());
    }
  }

<List<PopularMovie>fetchFavouriteMovies()  {
    final jsonString =  rootBundle.loadString('assets/popular_movies.json');
    final popularMoviesResponse = jsonDecode(jsonString);
    final movieList = (popularMoviesResponse['items'] as List<dynamic>).map((movieJson) => PopularMovie.fromJson(movieJson));
    return movieList.toList();
  }

}