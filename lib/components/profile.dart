import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "MyProfile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      
      body:
       Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
          leading: Icon(CupertinoIcons.home),
          title: Text("Home")),
          
        
        
        ListTile(
          leading: Icon(CupertinoIcons.profile_circled),
          title: Text("Profile")),
          
        
        
        ListTile(
          leading: Icon(CupertinoIcons.mail),
          title: Text("Email",
          )),
        
        ],));
      
    
  }
}