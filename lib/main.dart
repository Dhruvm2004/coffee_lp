import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lp_2024/components/all_detail.dart';
import 'package:lp_2024/components/bottom_nav.dart';
import 'package:lp_2024/components/cart.dart';
import 'package:lp_2024/components/cold_detail.dart';
import 'package:lp_2024/components/detail_foodpage.dart';
import 'package:lp_2024/components/hot_detail.dart';
import 'package:lp_2024/components/profile.dart';

import 'package:lp_2024/firebase_options.dart';
import 'package:lp_2024/models/cold.dart';
import 'package:lp_2024/pages/cold_page.dart';
import 'package:lp_2024/pages/food_page.dart';
import 'package:lp_2024/pages/front_page.dart';
import 'package:lp_2024/pages/hot_page.dart';
import 'package:lp_2024/pages/login_page.dart';
import 'package:lp_2024/pages/home_page.dart';
import 'package:lp_2024/pages/signup_page.dart';
import 'package:lp_2024/pages/splash.dart';

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
        appBarTheme: AppBarTheme(
          color: Colors.brown[700],
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          

        )
      ),
      home:Splash(),
      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.signuproute:(context)=>SignupPage(),
        MyRoutes.frontroute:(context)=>FrontPage(),
        MyRoutes.cartRoute:(context)=>CartPage(),
        MyRoutes.profileRoute:(context)=>ProfilePage(),
        MyRoutes.bottomRoute:(context)=>BottomNav(),
        MyRoutes.hotRoute:(context)=>HotPage(),
        MyRoutes.coldRoute:(context)=>ColdPage(),
        MyRoutes.foodRoute:(context)=>FoodPage(),
        MyRoutes.detailRoute:(context)=>DetailPage(),
        MyRoutes.hotDetailRoute:(context)=>HotDetail(),
          MyRoutes.coldDetailRoute:(context)=>ColdDetail(),
            MyRoutes.allDetailRoute:(context)=>AllDetail(),


        
      },
    );
  }
}
