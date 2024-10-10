import 'package:flutter/material.dart';
import 'package:lp_2024/utils/routes.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 100, bottom: 40),
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage("images/coffe6.jpg"),
                fit: BoxFit.cover,
                opacity: 0.6),
          ),
          child:

              // padding: EdgeInsets.only(top: 100,bottom: 40),
              // decoration: BoxDecoration(
              //   color: Colors.black,
              //   image: DecorationImage(image: AssetImage("images/coffe5.jpg"),
              //   fit: BoxFit.cover,
              //   opacity: 0.6
              //   ),
              //    ),
              Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("MugMate",
                  style: GoogleFonts.styleScript(
                      fontSize: 50, color: Colors.white)),
              Column(
                children: [
                  Text(
                    "One Sip is the only TRICK...",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                  SizedBox(height: 80,width: 100),
                  InkWell(
                    onTap: ()=>Navigator.pushNamed(context,MyRoutes.loginRoute),
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Get Started",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white
                      ),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
