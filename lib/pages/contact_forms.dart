import 'package:dart_flutter_course/db/db_helpter.dart';
import 'package:dart_flutter_course/models/contact_model.dart';
import 'package:dart_flutter_course/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactFormPage extends StatefulWidget {
  const ContactFormPage({super.key});

  @override
  State<ContactFormPage> createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final designationController = TextEditingController();
  final companyController = TextEditingController();
  final webController = TextEditingController();
  final addressController = TextEditingController();

  void _savecontact() {
    if (formKey.currentState!.validate()) {
      final contact = ContactModel(
        contactName: nameController.text,
        mobile: mobileController.text,
        address: addressController.text,
        company: companyController.text,
        website: webController.text,
        designation: designationController.text,
        email: emailController.text,
      );
      // contactList.add(contact);
      Dbhelper()
          .insert(contact)
          .then((newRowID) {
            if (newRowID > 0) {
              context.pop(context);
            }
          })
          .catchError((error) {
            showMsg(context, "Failed to save.");
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Form"),
        actions: [IconButton(onPressed: _savecontact, icon: Icon(Icons.save))],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Enter Your Name",
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Name is required";
                }
                if (value.length > 10) {
                  return "Name is must be max 10 char";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                filled: true,
                labelText: "Enter Your Mobile",
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Mobile is required";
                }
                if (value.length > 10) {
                  return "Mobile is must be max 11 char";
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Enter Your email",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Enter Your address",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: companyController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Enter Your company",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: webController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Enter Your website",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: designationController,
              decoration: InputDecoration(
                filled: true,
                labelText: "Enter Your designation",
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    designationController.dispose();
    companyController.dispose();
    webController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
