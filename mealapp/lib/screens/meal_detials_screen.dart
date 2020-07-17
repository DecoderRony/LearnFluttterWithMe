import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/mealDescription.dart';

class MealDetailsScreen extends StatelessWidget {
  final Function isMealFav;
  final Function addToFav;
  MealDetailsScreen(this.isMealFav, this.addToFav);
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as String;
    final data = DUMMY_MEALS.firstWhere((meal) {
      return meal.id.contains(args);
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
      ),
      body: ListView(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MealDescripton(
                  title: data.title,
                  ing: data.ingredients,
                  desc: data.steps,
                  img: data.imageUrl,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: FloatingActionButton(
                    child: isMealFav(args)
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    onPressed: () => addToFav(args),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
