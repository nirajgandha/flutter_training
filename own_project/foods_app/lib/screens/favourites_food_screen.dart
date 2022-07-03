import 'package:flutter/material.dart';

import '../models/food.dart';
import '../widgets/food_item.dart';

class FavouritesFoodScreen extends StatelessWidget {
  final List<Food> favoriteFoods;

  FavouritesFoodScreen(this.favoriteFoods);

  @override
  Widget build(BuildContext context) {
    if (favoriteFoods.isEmpty) {
      return Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          var categoryFoodsItem = favoriteFoods[index];
          return FoodItem(
            id: categoryFoodsItem.id,
            title: categoryFoodsItem.title,
            imageUrl: categoryFoodsItem.imageUrl,
            duration: categoryFoodsItem.duration,
            complexity: categoryFoodsItem.complexity,
            affordability: categoryFoodsItem.affordability,
          );
        },
        itemCount: favoriteFoods.length,
      );
    }
  }
}
