import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('Welcome'), backgroundColor: Colors.blue),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Image.asset("assets/images/image.png"),
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Anirban rahi", style: TextStyle(fontSize: 30)),
                        Text("Hello how are you"),
                      ],
                    ),
    
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          iconSize: 20,
                          icon: Icon(Icons.star, color: Colors.green),
                        ),
                        Text("10"),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          iconSize: 50,
                          icon: Icon(Icons.call),
                        ),
                        Text("Call Me"),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          iconSize: 50,
                          icon: Icon(Icons.message),
                        ),
                        Text("Message Me"),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          iconSize: 50,
                          icon: Icon(Icons.share),
                        ),
                        Text("Share Me"),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  bio,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

const bio =
    '''Conx Bazar is a well-known market area in Bangladesh that is often associated with busy streets, 
    small shops, and local vendors selling a wide variety of everyday goods. It serves as a common shopping spot for nearby residents where people can find food items, clothing, 
    and household essentials at relatively affordable prices. The place is usually crowded, especially in the evening, and reflects the typical atmosphere of a traditional "
    South Asian market with constant activity and bargaining between buyers and sellers.''';
