import 'package:flutter/material.dart';

class ListViewE extends StatefulWidget {
  const ListViewE({super.key});

  @override
  State<ListViewE> createState() => _ListViewE();
}

class _ListViewE extends State<ListViewE> {
  List<String> items = [];
  int index = 0;
  @override
  void initState() {
    super.initState();
    items = List.generate(100, (index) => 'Item ${index + 1}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List View")),
      body: ListView.builder(
        padding: EdgeInsets.all(0.8),
        itemCount: items.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(1),
          child: ListTile(
            tileColor: index.isEven ? Colors.grey : Colors.black,
            title: Text(items[index]),
            subtitle: Text("Subtitle"),
            trailing: Icon(Icons.favorite),
            leading: Icon(Icons.shopping_bag),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
