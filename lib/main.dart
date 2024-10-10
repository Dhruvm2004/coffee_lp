import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lp_2024/firebase_options.dart';
import 'package:lp_2024/pages/front_page.dart';
import 'package:lp_2024/pages/login_page.dart';
import 'package:lp_2024/pages/home_page.dart';
import 'package:lp_2024/pages/signup_page.dart';

import 'package:lp_2024/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform
  );
  runApp(MugMate());
}

class MugMate extends StatelessWidget {
  const MugMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
      ),
      home:HomePage(),
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.signuproute:(context)=>SignupPage(),
        // MyRoutes.frontroute:(context)=>FrontPage(),
      },
    );
  }
}
