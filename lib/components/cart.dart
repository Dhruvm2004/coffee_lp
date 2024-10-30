import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade700,
        title: Text("Cart",
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.w700,
        ),
        ),
      ),
    );
  }
}