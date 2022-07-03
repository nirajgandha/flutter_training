import 'package:flutter/material.dart';
import 'package:foods_app/widgets/food_item.dart';
import '../models/food.dart';

class CategoryFoodScreen extends StatefulWidget {
  static const routeName = '/category-foods';
  final List<Food> availableFoods;
  CategoryFoodScreen(this.availableFoods);
  @override
  State<CategoryFoodScreen> createState() => _CategoryFoodScreenState();
}

class _CategoryFoodScreenState extends State<CategoryFoodScreen> {
  String foodCategoryTitle;
  List<Food> displayFoods;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      foodCategoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayFoods = widget.availableFoods.where((food) {
        return food.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodCategoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var categoryFoodsItem = displayFoods[index];
          return FoodItem(
            id: categoryFoodsItem.id,
            title: categoryFoodsItem.title,
            imageUrl: categoryFoodsItem.imageUrl,
            duration: categoryFoodsItem.duration,
            complexity: categoryFoodsItem.complexity,
            affordability: categoryFoodsItem.affordability,
          );
        },
        itemCount: displayFoods.length,
      ),
    );
  }
}
