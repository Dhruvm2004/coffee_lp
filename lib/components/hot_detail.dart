import 'package:flutter/material.dart';
import 'package:lp_2024/models/food.dart';
import 'package:lp_2024/models/hot.dart';

class HotDetail extends StatelessWidget {
  const HotDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Welcome food = ModalRoute.of(context)!.settings.arguments as Welcome;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          food.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(food.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Food Name
              Text(
                food.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              // Prep Time
              Text(
                "Prep Time: ${food.prepTime}",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),

              // Description
              Text(
                food.description,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Ingredients: ${food.recipeIngredient}",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),

              // Additional Information Section (optional)
              // You can add more details such as ingredients, nutrition, etc.
              // For example, if the Food model has an ingredients property:
              // Text(
              //   "Ingredients: ${food.ingredients.join(', ')}",
              //   style: TextStyle(fontSize: 16, height: 1.5),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
