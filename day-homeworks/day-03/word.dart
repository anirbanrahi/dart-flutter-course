import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as ew;

class Words extends StatefulWidget {
  const Words({super.key});

  @override
  State<Words> createState() => _Words();
}

class _Words extends State<Words> {
  List<String> items = [];
  List<ew.WordPair> pairs = [];
  List<ew.WordPair> favorites = [];
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pairs = ew.generateWordPairs().take(100).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentIndex == 0 ? "All Items" : "Favorite Items"),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(0.8),
        itemCount: currentIndex == 0 ? pairs.length : favorites.length,
        itemBuilder: (context, index) {
          final pair = currentIndex == 0 ? pairs[index] : favorites[index];
          return (Padding(
            padding: EdgeInsets.all(1),
            child: ListTile(
              tileColor: index.isEven ? Colors.grey : Colors.white,
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    if (favorites.contains(pair)) {
                      favorites.remove(pair);
                    } else {
                      favorites.add(pair);
                    }
                  });
                },
                icon: Icon(
                  favorites.contains(pair)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
              title: RichText(
                text: TextSpan(
                  text: pair.first,
                  style: TextStyle(color: Colors.red),
                  children: [
                    TextSpan(
                      text: pair.second,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
          ));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            setState(() {
              currentIndex = 0;
            });
          } else if (index == 1) {
            setState(() {
              currentIndex = 1;
            });
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
