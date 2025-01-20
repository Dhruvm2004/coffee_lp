import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lp_2024/components/all_detail.dart';
import 'package:lp_2024/components/bottom_nav.dart';
import 'package:lp_2024/components/cart.dart';
// import 'package:lp_2024/components/cart_provider.dart';
import 'package:lp_2024/components/cold_detail.dart';
import 'package:lp_2024/components/detail_foodpage.dart';
import 'package:lp_2024/components/hot_detail.dart';
import 'package:lp_2024/components/profile.dart';

import 'package:lp_2024/firebase_options.dart';

import 'package:lp_2024/pages/first_page.dart';

import 'package:lp_2024/pages/front_page.dart';

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
  
  runApp(
     
    const MugMate());
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
          iconTheme: const IconThemeData(
            color: Colors.white
          ),
          

        )
      ),
      home:const Splash(),
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.signuproute:(context)=>const SignupPage(),
        MyRoutes.frontroute:(context)=>const FrontPage(),
        MyRoutes.cartRoute:(context)=>const CartPage(),
        MyRoutes.profileRoute:(context)=>const ProfilePage(),
        MyRoutes.bottomRoute:(context)=>const BottomNav(),
        
        MyRoutes.detailRoute:(context)=>const DetailPage(),
        MyRoutes.hotDetailRoute:(context)=>const HotDetail(),
          MyRoutes.coldDetailRoute:(context)=>const ColdDetail(),
            MyRoutes.allDetailRoute:(context)=>const AllDetail(),
            MyRoutes.firstRoute:(context)=>const FirstPage()


        
      },
    );
  }
}
