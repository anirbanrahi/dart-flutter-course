import 'package:dart_flutter_course/db/db_helpter.dart';
import 'package:dart_flutter_course/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:dart_flutter_course/routes/router.dart';
import 'package:dart_flutter_course/routes/routes.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContactModel> contactList = [];

  @override
  void initState() {
    super.initState();
    Dbhelper().getAllContacts().then((value) {
      contactList = value;
      setState(() {});
    });
  }

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
              onPressed: () async {
                final value = contact.favorite ? 0 : 1;
                await Dbhelper().updateContactField(contact.id, {
                  contactsColFavorite: value,
                });
                contactList = await Dbhelper().getAllContacts();
                setState(() {});
              },
              icon: Icon(
                contact.favorite ? Icons.favorite : Icons.favorite_border,
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushNamed(Routes.contactForm.name);
          contactList = await Dbhelper().getAllContacts();
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
