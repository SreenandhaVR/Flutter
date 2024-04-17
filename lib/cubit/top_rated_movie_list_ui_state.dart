import '../models/top_rated_movie_response.dart';


sealed class TopRatedMovieListUIState {}

class Initial extends TopRatedMovieListUIState {}
class Loading extends TopRatedMovieListUIState {}
class Success extends TopRatedMovieListUIState {
  Success(this.movieList);

  final List<TopRatedMovie> movieList;
}
class Error extends TopRatedMovieListUIState {}