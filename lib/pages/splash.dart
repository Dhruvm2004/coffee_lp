import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lp_2024/pages/home_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade700,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSplashScreen(
              splash: Icons.coffee,
              backgroundColor: Colors.brown,
              splashTransition: SplashTransition.fadeTransition,
              nextScreen: HomePage(),
              duration: 2000, // Adjust duration if necessary
            ),
            Container(
              child: Text(
                "MugMate",
                style: GoogleFonts.styleScript(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
