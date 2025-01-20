import 'package:flutter/material.dart';
class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text("Home",
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
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0
                    ),
                    width: screenWidth *0.8,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search,color: Colors.black54.withOpacity(0.6),
                        ),
                        const SizedBox(width: 8,),
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
                  ),
                 
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context,'/front'),
              child: SizedBox(
                
                height: 300,
                width: screenWidth,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    
                    
                    elevation: 4.0,
                    // shadowColor: Colors.black,
                    color: Colors.black,
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0), // Optional rounded corners
                    ),
                    child:Stack(
                      
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            'assets/images/coffee1.jpg', // Replace with your image asset
                            height: 300,
                            width: screenWidth,
                            fit: BoxFit.cover,)

                      ),
                      const Positioned(
                        left: 16,
                        bottom: 16,
                      
                      child: Text("All Menu",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      
                        
                      ),),)
                     ],
                    )
                    
                  ),
                ),
              ),
            ),
            SizedBox(
              
              height: 300,
              width: screenWidth,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  
                  elevation: 4.0,
                  // shadowColor: Colors.black,
                  color: Colors.black,
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0), // Optional rounded corners
                  ),
                  child:Stack(
                      
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            'assets/images/coffee2.jpg', // Replace with your image asset
                            height: 300,
                            width: screenWidth,
                            fit: BoxFit.fill,)

                      ),
                      const Positioned(
                        left: 16,
                        bottom: 16,
                      
                      child: Text("Special Offers",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      
                        
                      ),),)
                     ],
                    )
                ),
              ),
            ),
            SizedBox(
              
              height: 300,
              width: screenWidth,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  
                  elevation: 4.0,
                  // shadowColor: Colors.black,
                  color: Colors.black,
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0), // Optional rounded corners
                  ),
                  child:Stack(
                      
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset(
                            'assets/images/coffee3.jpg', // Replace with your image asset
                            height: 300,
                            width: screenWidth,
                            fit: BoxFit.cover,)

                      ),
                      const Positioned(
                        left: 16,
                        bottom: 16,
                      
                      child: Text("Seasonal Special",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      
                        
                      ),),)
                     ],
                    )
                ),
              ),
            )
          ],
        ),
      )

    );
  }
}