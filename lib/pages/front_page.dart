
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:lp_2024/models/all_pro.dart';
import 'package:lp_2024/pages/auth.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

final User? user = Auth().currentUser;

Future<void> signOut() async {
  await Auth().signOut();
}

class _FrontPageState extends State<FrontPage> {
  List<Instruction> postList = [];

  Future<List<Instruction>> getPostApi() async {
    final response = await http.get(
      Uri.parse('https://unicode-flutter-lp.onrender.com/get_all_products'),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      postList = (data as List)
          .map((i) => Instruction.fromJson(Map<String, dynamic>.from(i)))
          .toList();
      return postList;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Instruction>>(
              future: getPostApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No products found"));
                } else {
                  postList = snapshot.data!;
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      final product = postList[index];
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        
                        
                        
                        
                        child: Padding(
                          
                          padding: EdgeInsets.all(16.0),
                          
                          
                          
                          
                          
                          child: 
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                
                                children: [
                                  
                                 
                                  Text(
                                    product.name, // Assuming 'name' is a field in Instruction
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Text(
                                    "Time: \$${product.prepTime}", // Assuming 'price' is a field
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  
                                            Row(
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                ElevatedButton(onPressed: (){}, 
                                                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.brown.shade800))
                                                ,child: Icon(Icons.add,color: Colors.white,))
                                               ],
                                            )
                                  
                                  
                                ],
                              ),
                            
                          ),
                          
                          
                        
                        
                        
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:http/http.dart' as http;
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lp_2024/components/bottom_nav.dart';
// import 'package:lp_2024/models/all_pro.dart';

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
//   List<Instruction> postList = [];
//   Future<List<Instruction>> getPostApi() async {
//     final response = await http.get(
//         Uri.parse('https://unicode-flutter-lp.onrender.com/get_all_products'));
//     var data = jsonDecode(response.body.toString());
//     if (response.statusCode == 200) {
//       for(Map i in data){
//         postList.add(Instruction.fromJson(Map<String, dynamic>.from(i)));
//       }
//       return postList;
//     } else {
//       return postList;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(
//           "Home",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(future: getPostApi(), builder: (context,snapshot){
//               if(!snapshot.hasData){
//                 return Text("loading");
//               }else {
//                 return ListView.builder(
//                   itemCount: postList.length,
//                   itemBuilder: (context,index){
//                   return Card(
//                     child: Column(
//                       children: [
//                         Text(postList[index].toString()),
//                       ],
//                     ),
//                   );
//                 });
            
//               };
//             }),
//           )
//         ],
//       ),
//     );
//   }
// }