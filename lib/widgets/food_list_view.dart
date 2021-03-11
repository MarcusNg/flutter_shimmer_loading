import 'package:flutter/material.dart';
import 'package:flutter_shimmer_loading/data.dart';
import 'package:shimmer/shimmer.dart';

class FoodListView extends StatelessWidget {
  final List<Food> foodItems;
  final bool isLoading;

  const FoodListView({required this.foodItems, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  leading: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      color: Colors.grey[300],
                    ),
                  ),
                  title: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(height: 16.0, color: Colors.grey[300]),
                  ),
                  subtitle: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(height: 16.0, color: Colors.grey[300]),
                  ),
                  trailing: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 24.0,
                      width: 24.0,
                      color: Colors.grey[300],
                    ),
                  ),
                );
              },
              childCount: 10,
            ),
          )
        : SliverList(
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
