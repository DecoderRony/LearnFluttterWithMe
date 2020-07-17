import 'package:flutter/material.dart';

import './screens/category_select.dart';
import './screens/meal_detials_screen.dart';
import './screens/tabs_Scree.dart';
import './screens/FilterScreen.dart';
import './dummy_data.dart';
import './models/mealModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _availableMeal = DUMMY_MEALS;
  List<Meal> favouriteMeals = [];
  Map<String, Object> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  void addToFav(var id) {
    int value = favouriteMeals.indexWhere((meal) => meal.id == id);

    if (value >= 0) {
      setState(() {
        favouriteMeals.removeAt(value);
      });
    } else {
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));
      });
    }
  }

  bool isMealFav(String id) {
    return favouriteMeals.any((meal) => meal.id == id);
  }

  void addFilters(Map<String, Object> newFilters) {
    setState(() {
      filters = newFilters;

      _availableMeal = DUMMY_MEALS.where((element) {
        if (filters['gluten'] && !element.isGlutenFree) return false;
        if (filters['lactose'] && !element.isLactoseFree) return false;
        if (filters['vegan'] && !element.isVegan) return false;
        if (filters['vegetarian'] && !element.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Recipe\'s on the go',
        // home: HomeScreen(),
        routes: {
          '/': (context) => HomeScreen(favouriteMeals),
          '/category/meal': (context) => CategorySelect(_availableMeal),
          '/category/meal/meal-details': (context) =>
              MealDetailsScreen(isMealFav, addToFav),
          '/filter': (context) => FilterScreen(addFilters),
        });
  }
}
