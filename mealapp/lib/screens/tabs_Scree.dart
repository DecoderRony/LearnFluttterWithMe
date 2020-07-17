import 'package:flutter/material.dart';

import '../models/mealModel.dart';
import '../widgets/navigationDrawer.dart';
import 'categories_screen.dart';
import 'favouritesScreen.dart';

class HomeScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  HomeScreen(this.favouriteMeals);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> widgets;
  int indexCount = 0;
  void _selectPage(index) {
    setState(() => indexCount = index);
  }

  @override
  void initState() {
    widgets = [
      {'page': CategoriesScreen(), 'title': "Categories"},
      {'page': FavouritesScreen(widget.favouriteMeals), 'title': "Favourites"}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgets[indexCount]['title']),
      ),
      //NAVIGATION__DRAWER
      drawer: NavigationDrawer(),
      //DRAWER__ENDS
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexCount,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text('Categories')),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), title: Text('Favourites')),
          ]),
      body: widgets[indexCount]['page'],
    );
  }
}
