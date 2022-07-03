import 'package:flutter/material.dart';
import '../widgets/food_category_item.dart';
import '../dummy_data.dart';

class FoodCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_FOOD_CATEGORIES
          .map(
            (foodCategoryData) => FoodCategoryItem(
              foodCategoryData.id,
              foodCategoryData.title,
              foodCategoryData.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
