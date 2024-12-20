import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lp_2024/models/hot.dart';
import 'package:lp_2024/utils/routes.dart';

class HotPage extends StatefulWidget {
  const HotPage({super.key});

  @override
  State<HotPage> createState() => _HotPageState();
}

class _HotPageState extends State<HotPage> {
  List<Welcome> postList = [];
  String? selectedType;
  final List<String> chipOptions = ['ALL', 'Hot', 'Cold', 'Food'];
  int? _value = 1;
  Future<List<Welcome>> getPostApi() async {
    final response = await http.get(
      Uri.parse(
          'https://unicode-flutter-lp-new.onrender.com/get_products_by_category?category=HOT%20BEVERAGES'),
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      postList = (data as List)
          .map((i) => Welcome.fromJson(Map<String, dynamic>.from(i)))
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
            "Hot Beverages",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(children: [
          Wrap(
              children: List.generate(4, (int index) {
            return ChoiceChip(
              padding: EdgeInsets.all(8),
              label: Text(chipOptions[index]),
              selected: _value == index,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? index : null;
                });
                if (selected) {
                  // Navigate to the corresponding page
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(context, '/front');
                      break;
                    case 1:
                      Navigator.pushNamed(context, '/hot');
                      break;
                    case 2:
                      Navigator.pushNamed(context, '/cold');
                      break;
                    case 3:
                      Navigator.pushNamed(context, '/food');
                  }
                }
              },
            );
          })),
          Expanded(
              child: FutureBuilder<List<Welcome>>(
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
                // return GridView.builder(
                //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //         crossAxisCount: 3,
                //         mainAxisSpacing: 16,
                //         crossAxisSpacing: 16),

                //     itemBuilder: (context, index) {
                //       final product = postList[index];
                //       return Card(
                //         clipBehavior: Clip.antiAlias,
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(15),
                //         ),
                //         child: GridTile(
                //           child:
                //         Image.network(product.image,fit: BoxFit.fitWidth,height: 80,
                //         ),
                //         footer: Container(child: Text(product.prepTime),
                //         padding: EdgeInsets.all(10),
                //         ),),
                //       );

                //     },
                //     itemCount: postList.length,);
                return ListView.builder(
                  itemCount: postList.length,
                  itemBuilder: (context, index) {
                    final product = postList[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 10,
                      child: ListTile(
                        leading: Image.network(
                          product.image,
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                        title: Text(product.name),
                        subtitle: Text("Prep-Time:${product.prepTime}"),
                        trailing: FloatingActionButton(
                            onPressed: () => Navigator.pushNamed(
                                context, MyRoutes.cartRoute),
                            child: Icon(CupertinoIcons.add),
                            backgroundColor: Colors.green[200],),
                        onTap: () {
                          Navigator.pushNamed(context, MyRoutes.hotDetailRoute,
                              arguments: product);
                        },
                      ),
                    );
                  },
                );
              }
            },
          )),
        ]));
  }
}
