import 'package:flutter/material.dart';
import 'package:flutter_shimmer_loading/data.dart';

class FoodListView extends StatelessWidget {
  final List<Food> foodItems;

  const FoodListView({required this.foodItems});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final food = foodItems[index];
          return ListTile(
            leading: Image.network(
              food.imageURL,
              height: 60.0,
              width: 60.0,
              fit: BoxFit.cover,
            ),
            title: Text(food.name),
            subtitle: Text('\$${food.price}'),
            trailing: Icon(Icons.chevron_right),
          );
        },
        childCount: foodItems.length,
      ),
    );
  }
}
