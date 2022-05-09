import 'package:contact_list/contact.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  final Contact contact;
  const ContactView({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${contact.name} profile"),
      ),
    );
  }
}
