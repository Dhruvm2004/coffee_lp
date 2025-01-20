// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           "MyProfile",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
      
//       body:
//        Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           ListTile(
//           leading: Icon(CupertinoIcons.home),
//           title: Text("Home")),
          
        
        
//         ListTile(
//           leading: Icon(CupertinoIcons.profile_circled),
//           title: Text("Profile")),
          
        
        
//         ListTile(
//           leading: Icon(CupertinoIcons.mail),
//           title: Text("Email",
//           )),
        
//         ],));
      
    
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<Map<String, dynamic>?> getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return snapshot.data() as Map<String, dynamic>?;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("User data not found."));
          }

          final userData = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Icon(CupertinoIcons.profile_circled,
                     color: Colors.purple[900]),
                    title: const Text("Name"),
                    subtitle: Text(userData['name'] ?? 'No name provided'),
                  ),
                ),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Icon(CupertinoIcons.mail,
                     color: Colors.purple[900]),
                    title: const Text("Email"),
                    subtitle: Text(userData['email'] ?? 'No email provided'),
                  ),
                ),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Icon(CupertinoIcons.phone,
                    color: Colors.purple[900],),
                    title: const Text("Phone Number"),
                    subtitle: Text(userData['phone'] ?? 'No phone number provided'),
                  ),
                ),
                Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    leading: Icon(CupertinoIcons.calendar,
                     color: Colors.purple[900]),
                    title: const Text("Date of Birth"),
                    subtitle: Text(userData['date_of_birth'] ?? 'No date of birth provided'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
