import 'package:flutter/material.dart';
import 'package:foods_app/dummy_data.dart';
import 'screens/food_detail_screen.dart';
import './screens/tabs_screen.dart';
import 'screens/food_categories_screen.dart';
import 'screens/category_foods_screen.dart';
import './screens/filter_screen.dart';
import 'models/food.dart';

void main() => runApp(FoodApp());

class FoodApp extends StatefulWidget {
  @override
  _FoodAppState createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Food> _availableFoods = DUMMY_FOODS;
  List<Food> _favoriteFoods = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableFoods = DUMMY_FOODS.where((food) {
        if (_filters['gluten'] && !food.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !food.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !food.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !food.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteFoods.indexWhere((meal) => meal.id == mealId);

    setState(
      () {
        if (existingIndex == -1) {
          _favoriteFoods
              .add(DUMMY_FOODS.firstWhere((meal) => meal.id == mealId));
        } else {
          _favoriteFoods.removeAt(existingIndex);
        }
      },
    );

    // if (existingIndex == -1) {
    //   _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    // } else {
    //   setState(() {
    //     _favoriteMeals.removeAt(existingIndex);
    //   });
    // }
  }

  bool _isMealFavorite(String id) {
    return _favoriteFoods.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabScreen(_favoriteFoods),
        CategoryFoodScreen.routeName: (ctx) =>
            CategoryFoodScreen(_availableFoods),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, _setFilters)
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => FoodCategoriesScreen());
      },
    );
  }
}
