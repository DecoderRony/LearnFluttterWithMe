import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(1),
      children: DUMMY_CATEGORIES
          .map((data) => CategoryItem(data.title, data.color, data.id))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
    );
  }
}
