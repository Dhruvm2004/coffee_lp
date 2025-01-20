import 'package:flutter/material.dart';
import 'package:lp_2024/models/all_pro.dart';

class AllDetail extends StatelessWidget {
  const AllDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final Instruction food = ModalRoute.of(context)!.settings.arguments as  Instruction;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          food.name,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              const SizedBox(height: 16),

              // Food Name
              Text(
                food.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Prep Time
              Text(
                "Prep Time: ${food.prepTime}",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                food.description,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Ingredients: ${food.recipeIngredient}",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 16),

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
