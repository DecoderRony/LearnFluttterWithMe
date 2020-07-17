import 'package:flutter/material.dart';
import '../models/mealModel.dart';

import '../widgets/mealsList.dart';

class CategorySelect extends StatefulWidget {
  final List<Meal> _availableMeal;
  CategorySelect(this._availableMeal);

  @override
  _CategorySelectState createState() => _CategorySelectState();
}

class _CategorySelectState extends State<CategorySelect> {
  String title;
  String id;
  var chosenMealAccordingToCat;
  var loadinitData = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!loadinitData) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      title = args['title'];
      id = args['id'];

      chosenMealAccordingToCat = widget._availableMeal.where((meal) {
        return meal.categories.contains(id);
      }).toList();
      loadinitData = true;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealList(
            id: chosenMealAccordingToCat[index].id,
            title: chosenMealAccordingToCat[index].title,
            imageUrl: chosenMealAccordingToCat[index].imageUrl,
            duration: chosenMealAccordingToCat[index].duration,
            complexity: chosenMealAccordingToCat[index].complexity,
            affordability: chosenMealAccordingToCat[index].affordability,
          );
        },
        itemCount: chosenMealAccordingToCat.length,
      ),
    );
  }
}
