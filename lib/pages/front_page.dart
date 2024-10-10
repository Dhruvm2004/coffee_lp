// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:lp_2024/pages/auth.dart';
// import 'package:lp_2024/pages/signup_page.dart';

// class FrontPage extends StatefulWidget {
//   const FrontPage({super.key});

//   @override
//   State<FrontPage> createState() => _FrontPageState();
// }

// final User? user = Auth().currentUser;

// Future<void> signOut() async {
//   await Auth().signOut();
// }

// class _FrontPageState extends State<FrontPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("MugMate"),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(padding: EdgeInsets.zero,
//               child: UserAccountsDrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Colors.black
//                 ),
//                 margin: EdgeInsets.zero,
//                 accountName: Text('name'), accountEmail:Text('email'))),
//                  ListTile(
//           leading: Icon(CupertinoIcons.home),
//           title: Text("Home",
//           textScaler: TextScaler.linear(1.2)),
//                  )
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNav(),
//     );
//   }
// }
