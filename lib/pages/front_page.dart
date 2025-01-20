import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'package:lp_2024/models/all_pro.dart';
import 'package:lp_2024/pages/auth.dart';
import 'package:lp_2024/utils/routes.dart';

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
  String? selectedType;
  final List<String> chipOptions = ['ALL', 'Hot', 'Cold', 'Food'];
  int _value = 0;

  // Declare a variable to store the Future result
  late Future<List<Instruction>> postApiFuture;

  @override
  void initState() {
    super.initState();
    postApiFuture = getPostApi(); 
  }

  // Function to fetch data from API
  Future<List<Instruction>> getPostApi() async {
    try {
      final response = chipOptions[_value] == "ALL"
          ? await http.get(Uri.parse(
              'https://unicode-flutter-lp-new-final.onrender.com/get_all_products'))
          : await http.get(Uri.parse(
              'https://unicode-flutter-lp-new-final.onrender.com/get_products_by_category?category=${chipOptions[_value]}'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        postList = data.map<Instruction>((json) => Instruction.fromJson(json)).toList();
        return postList;
      } else {
        print('Failed to load data');
        return [];
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Menu",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            
            Wrap(
              spacing: 8.0,
              children:[
               ... List.generate(chipOptions.length, (index) {
                  return ChoiceChip(
                    backgroundColor: const Color(0xFF834D1E),
                    label: Text(chipOptions[index], style: const TextStyle(color: Colors.white)),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : _value;
                        postApiFuture = getPostApi(); // Update the Future when chip is selected
                      });
                    },
                  );
                }),
              ],
            ),
            const SizedBox(height: 15),
            
            Expanded(
              child: FutureBuilder<List<Instruction>>(
                future: postApiFuture, // Use the cached future
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No products available.'));
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data![index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          elevation: 10,
                          child: ListTile(
                            leading: SizedBox(
                              height: 50,
                              width: 50,
                              child: Image.network(
                                product.image,
                                fit: BoxFit.cover,
                                height: 50,
                                width: 50,
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                              (loadingProgress.expectedTotalBytes ?? 1)
                                          : null,
                                    ),
                                  );
                                },
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.error, size: 50);
                                },
                              ),
                            ),
                            title: Text(product.name),
                            subtitle: Text("Prep-Time: ${product.prepTime}"),
                            onTap: () => Navigator.pushNamed(
                              context,
                              MyRoutes.allDetailRoute,
                              arguments: product,
                            ),
                            trailing: FloatingActionButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  MyRoutes.allDetailRoute,
                                  arguments: product,
                                );
                              },
                              backgroundColor: Colors.green,
                              child: const Icon(Icons.add_outlined),
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
      ),
    );
  }
}
