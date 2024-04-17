import 'package:hive_flutter/adapters.dart';
part 'popular_movie_hive.g.dart';


@HiveType(typeId:0, adapterName: 'PopularMovieAdapter')
class PopularMovieHive extends HiveObject {
  PopularMovieHive({this.title,this.year});
  @HiveField(0)
  String? title;

  @HiveField(1)
  String? year;
}