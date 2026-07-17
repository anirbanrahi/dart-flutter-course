import 'package:flutter/material.dart';
import 'package:dart_flutter_course/models/contact_model.dart';
import 'package:go_router/go_router.dart';

class ContactDetailsPage extends StatelessWidget {
  final ContactModel contact;

  const ContactDetailsPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.contactName)),
      body: ListView(
        children: [
          Image.asset(contact.image, width: 100, height: 100),
          ListTile(title: Text(contact.contactName)),
          ListTile(
            title: Text(contact.mobile),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                IconButton(onPressed: () {}, icon: Icon(Icons.message)),
              ],
            ),
          ),
          ListTile(
            title: Text(
              contact.email.isEmpty ? "Email Not Saved" : contact.email,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [IconButton(onPressed: () {}, icon: Icon(Icons.email))],
            ),
          ),
          ListTile(
            title: Text(
              contact.address.isEmpty ? "Address Not Saved" : contact.email,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.location_city)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
