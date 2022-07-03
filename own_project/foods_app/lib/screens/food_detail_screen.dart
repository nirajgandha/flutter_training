import 'package:flutter/material.dart';
import 'package:foods_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/food-detail';
  final Function toggleFavorite;
  final Function isFoodFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFoodFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final foodId = ModalRoute.of(context).settings.arguments as String;
    final selectedFood = DUMMY_FOODS.firstWhere((food) => food.id == foodId);
    return Scaffold(
      appBar: AppBar(
        title: Text(foodId),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedFood.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(
              context,
              'Ingredients',
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedFood.ingredients[index],
                    ),
                  ),
                ),
                itemCount: selectedFood.ingredients.length,
              ),
            ),
            buildSectionTitle(
              context,
              'Steps',
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        selectedFood.steps[index],
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedFood.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFoodFavorite(foodId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(foodId),
      ),
    );
  }
}
