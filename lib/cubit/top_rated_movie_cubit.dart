import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/top_rated_movie_response.dart';
import 'top_rated_movie_list_ui_state.dart';
import 'package:http/http.dart' as http;

class TopRatedMovieCubit extends Cubit<TopRatedMovieListUIState>{
  TopRatedMovieCubit() : super(Initial());
  void _fetchTopRatedMoviesFromUrl( )async{
    emit(Loading());
    final topRatedMovies= await fetchDataFromUrl();
    if(topRatedMovies is List<TopRatedMovie>){
      emit(Success((topRatedMovies)));
    }else{
      emit(Error());
    }
  }
 Future<List<TopRatedMovie>> fetchDataFromUrl() async{
    const topRatedMovieUrl='https://movie-api-rish.onrender.com/top-rated';
    final topRatedMovieUri=Uri.parse(topRatedMovieUrl);
    try {
      final response = await http.get(topRatedMovieUri);
      final responseJson=jsonDecode(response.body);
      final topRatedMoviesList=(responseJson['items'] as List<dynamic>)
          .map((topRatedMovie) => TopRatedMovie.fromJson(topRatedMovie));
return topRatedMoviesList;
    }catch(e) {
      throw Exception(e);

    }
  }

}