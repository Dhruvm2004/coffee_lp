import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:Text("Home",
        style: 
        TextStyle(
          color: Colors.white
        ),) ,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0
                    ),
                    width: screenWidth *0.8,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search,color: Colors.black54.withOpacity(0.6),
                        ),
                        SizedBox(width: 8,),
                        Expanded(child: 
                        TextField(
                          
                          decoration: InputDecoration(
                            hintText: 'Crave Here',
                            hintStyle: TextStyle(
      color: Colors.black.withOpacity(0.5),  // Reduce opacity to 50%
    ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none
                            // contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                          ),
                        ))
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                  ),
                 
                ],
              ),
            ),
            SizedBox(
              
              height: 300,
              width: screenWidth,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  
                  elevation: 4.0,
                  // shadowColor: Colors.black,
                  color: Colors.black,
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0), // Optional rounded corners
                  ),
                ),
              ),
            ),
            SizedBox(
              
              height: 300,
              width: screenWidth,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  
                  elevation: 4.0,
                  // shadowColor: Colors.black,
                  color: Colors.black,
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0), // Optional rounded corners
                  ),
                ),
              ),
            ),
            SizedBox(
              
              height: 300,
              width: screenWidth,
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  
                  elevation: 4.0,
                  // shadowColor: Colors.black,
                  color: Colors.black,
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0), // Optional rounded corners
                  ),
                ),
              ),
            )
          ],
        ),
      )

    );
  }
}