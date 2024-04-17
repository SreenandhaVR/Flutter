import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movie_list_ui_state.dart';
import 'package:movie_app/cubit/top_rated_movie_list_ui_state.dart';
import 'package:movie_app/pages/top_rated_movies_page.dart';

class _TopRatedMovieListCubitState extends State<TopRatedMovieListCubit> {
  const TopRatedMovieListCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRatedMovieCubit>(),TopRatedMovieListUIState>(
      builder:(context,state){
        return switch(state){
          Initial() => const Center(child:CircularProgressIndicator(),),
          Loading => const Center(child: CircularProgressIndicator(),),
          Success =>ListView.builder(itemBuilder: (context,index){
        final movie=state.movieList[index];
        }
        Error()=> const Center(child: Text('something went wrong'),),
        };
    },);
  }
}
