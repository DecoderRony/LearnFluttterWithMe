import 'package:flutter/material.dart';

class MealDescripton extends StatelessWidget {
  final String title;
  final List<String> ing;
  final List<String> desc;
  final String img;

  List<Widget> ingre(List<String> ing) {
    return ing.map((e) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text('* $e'),
      );
    }).toList();
  }

  List<Widget> showDescription(List<String> desc) {
    int count = 0;
    return desc.map((desc) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text('${++count} $desc'),
      );
    }).toList();
  }

  MealDescripton({this.title, this.ing, this.desc, this.img});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
            child: Image.network(
              img,
              fit: BoxFit.cover,
            )),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Text(
            'INGREDIENTS',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ...ingre(ing),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text('DESCRIPTION',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        ...showDescription(desc),
        SizedBox(height: 10),
      ],
    );
  }
}
