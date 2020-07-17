import 'package:flutter/material.dart';

import 'package:mealapp/models/mealModel.dart';

class MealList extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealList(
      {this.id,
      this.title,
      this.imageUrl,
      this.duration,
      this.complexity,
      this.affordability});

  String get _complex {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Not Available";
    }
  }

  String get _affordable {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "High Priced";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Not Available";
    }
  }

  void pageChange(BuildContext context) {
    Navigator.pushNamed(context, '/category/meal/meal-details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pageChange(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    imageUrl,
                    height: 215,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 2,
                  child: Container(
                    color: Colors.black45,
                    width: 240,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Center(
                      child: Text(
                        title,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_alarm),
                      SizedBox(
                        width: 5,
                      ),
                      Text(duration.toString())
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.grade),
                      SizedBox(
                        width: 5,
                      ),
                      Text(_complex)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.shopping_basket),
                      SizedBox(
                        width: 5,
                      ),
                      Text(_affordable)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
