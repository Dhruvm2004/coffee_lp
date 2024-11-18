import 'dart:convert';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lp_2024/main.dart';
import 'package:lp_2024/models/all_pro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_cart/cart.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   var cart = CartPage();
//   await cart.initializeCart(isPersistenceSupportEnabled: true);
//   runApp(MugMate());
// }

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Instruction> _cartItems = [];

  Future<void> initializeCart(
      {required bool isPersistenceSupportEnabled}) async {
    // Add your cart initialization logic here
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cartData = prefs.getString('cartItems');
    if (cartData != null) {
      List<dynamic> jsonList = json.decode(cartData);
      _cartItems = jsonList.map((item) => Instruction.fromJson(item)).toList();
    }
  }

  // Set [isPersistenceSupportEnabled] to true to turn on the cart persistence
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade700,
        title: Text(
          "Cart",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
