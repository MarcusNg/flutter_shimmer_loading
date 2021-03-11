import 'package:flutter/material.dart';
import 'package:flutter_shimmer_loading/data.dart';

class FoodPageView extends StatefulWidget {
  final List<Food> foodItems;

  const FoodPageView({required this.foodItems});

  @override
  _FoodPageViewState createState() => _FoodPageViewState();
}

class _FoodPageViewState extends State<FoodPageView> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 60.0, 24.0, 4.0),
          child: const Text(
            'Most Popular',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          height: 200.0,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.foodItems.length,
            itemBuilder: (context, index) {
              final food = widget.foodItems[index];
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                width: 120.0,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  image: DecorationImage(
                    image: NetworkImage(food.imageURL),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
