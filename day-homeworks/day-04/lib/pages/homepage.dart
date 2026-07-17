import 'package:flutter/material.dart';
import 'package:dart_flutter_course/db/temp_db.dart';
import 'package:dart_flutter_course/routes/router.dart';
import 'package:dart_flutter_course/routes/routes.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact App")),
      body: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          final contact = contactList[index];
          return ListTile(
            onTap: () {
              context.goNamed(Routes.contactDetails.name, extra: contact);
            },
            title: Text(contact.contactName),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                contact.favorite ? Icons.favorite : Icons.favorite_border,
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(Routes.contactForm.name).then((_) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
