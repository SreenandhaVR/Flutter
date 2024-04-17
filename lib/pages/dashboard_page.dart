import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<DashboardPage> createState() => _DashboardPageState();

}

class _DashboardPageState extends State<DashboardPage> {
  var  _currentIndex = 0;
  final _bodyPages=const [


  ];
  final _bottomNavBarItems=[
    const BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: 'Dashboard',
    ),
    const  BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];


  void _onItemClick(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: _bodyPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:_currentIndex,
        items: _bottomNavBarItems,

        onTap: _onItemClick,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,

      ),
    );
  }
}
