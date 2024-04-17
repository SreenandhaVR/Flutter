import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/cubit/popular_movie_cubit.dart';
import 'package:movie_app/models/popular_movie_hive.dart';
import 'package:movie_app/pages/login_page.dart';
import 'package:movie_app/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await  Hive.initFlutter();
  Hive.registerAdapter(PopularMovieAdapter( ));
  await Hive.openBox<PopularMovieHive>('popular-movies');
  runApp(const MovieApp());

}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PopularMovieCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashPage(),
      ),
    );
  }
}
