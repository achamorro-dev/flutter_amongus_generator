import 'package:flutter/material.dart';

import 'package:amongus_generator/ui/home/views/favorites_view.dart';
import 'package:amongus_generator/ui/home/views/home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF353535),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Among Us Generator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: IndexedStack(
        children: [HomeView(), FavoritesView()],
        index: _selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
