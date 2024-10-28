import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
   final List<String> chipOptions = ['ALL', 'Hot', 'Cold', 'Food'];
  int? _value = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "Food",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
              Wrap(
              children: List.generate(4, (int index) {
            return ChoiceChip(
              padding: EdgeInsets.all(8),
              label: Text(chipOptions[index]),
              selected: _value == index,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? index : null;
                });
                if (selected) {
                  // Navigate to the corresponding page
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(context, '/front');
                      break;
                    case 1:
                      Navigator.pushNamed(context, '/hot');
                      break;
                    case 2:
                      Navigator.pushNamed(context, '/cold');
                      break;
                    case 3:
                      Navigator.pushNamed(context, '/food');
                  }
                }
              },
            );
          })),
          ],
        ),
    );
  }
}