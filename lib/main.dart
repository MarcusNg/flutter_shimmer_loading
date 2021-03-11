import 'package:flutter/material.dart';
import 'package:flutter_shimmer_loading/data.dart';
import 'package:flutter_shimmer_loading/widgets/food_list_view.dart';
import 'package:flutter_shimmer_loading/widgets/food_page_view.dart';

void main() {
  runApp(MyApp());
}

class FakeRepository {
  Future<List<Food>> mockRequest() async =>
      await Future.delayed(const Duration(seconds: 5), () => foodData);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Shimmer Loading',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FakeRepository().mockRequest(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final foodItems = snapshot.data as List<Food>;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: FoodPageView(foodItems: foodItems)),
                const SliverToBoxAdapter(
                  child: Divider(indent: 12.0, endIndent: 12.0),
                ),
                FoodListView(foodItems: foodItems),
              ],
            );
          }
          return CustomScrollView(
            physics: NeverScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: FoodPageView(
                  foodItems: [],
                  isLoading: true,
                ),
              ),
              const SliverToBoxAdapter(
                child: Divider(indent: 12.0, endIndent: 12.0),
              ),
              FoodListView(
                foodItems: [],
                isLoading: true,
              ),
            ],
          );
        },
      ),
    );
  }
}
