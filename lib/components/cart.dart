// import 'dart:convert';



// import 'package:flutter/material.dart';
// import 'package:lp_2024/models/all_pro.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:velocity_x/velocity_x.dart';

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   var cart = CartPage();
// //   await cart.initializeCart(isPersistenceSupportEnabled: true);
// //   runApp(MugMate());
// // }

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   List<Instruction> _cartItems = [];

//   Future<void> initializeCart(
//       {required bool isPersistenceSupportEnabled}) async {
//     // Add your cart initialization logic here
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? cartData = prefs.getString('cartItems');
//     if (cartData != null) {
//       List<dynamic> jsonList = json.decode(cartData);
//       _cartItems = jsonList.map((item) => Instruction.fromJson(item)).toList();
//     }
//   }

//   // Set [isPersistenceSupportEnabled] to true to turn on the cart persistence
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.brown.shade700,
//         title: const Text(
//           "Cart",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           const _CartList().p32().expand(),
//           const Divider(),
//           const _CartTotal(),

//         ],
//       ),
//     );
//   }
// }
// class _CartTotal extends StatelessWidget {
//   const _CartTotal();

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           '\$9999'.text.xl5.make(),
//           const WidthBox(150),
//           SizedBox(
//             width: 100,
//             child: FloatingActionButton(onPressed: (){
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 'buy not supported'.text.make()));
//             }
//             ,
//             elevation: 10,child: const Text('Buy',
//             style: TextStyle(
//               fontSize: 22,
              
//             ),)
//             ,
            
            
//             ),
//           )
//         ],
//       ),
//     ) ;}
// }
// class _CartList extends StatefulWidget {
//   const _CartList();

//   @override
//   State<_CartList> createState() => __CartListState();
// }

// class __CartListState extends State<_CartList> {
//   final List<Instruction> _cartItems = [];
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount:_cartItems.length,
//       itemBuilder: (context,index)=>ListTile(
//         leading: const Icon(Icons.done),
//         trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.remove_circle_outline)),
//         title: "Item 1".text.make(),
//       ),
//     );
//   }
// }
