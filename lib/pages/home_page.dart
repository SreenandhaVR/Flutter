import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/popular_movies_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.stacked_line_chart),),
              Tab(icon: Icon(Icons.timelapse),),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PopularMoviesPage(),
            Center(child: Text('Coming soon Movies'),),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Theme.of(context).primaryColor,
          currentIndex: 0, // Set this to the current index of the tab you want to highlight
          onTap: (int index) {
            // Handle navigation here, based on the tapped index
          },
        ),
      ),
    );
  }
}
