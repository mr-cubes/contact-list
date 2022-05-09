import 'package:contact_list/contact.dart';
import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  final Contact contact;
  const ContactWidget({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(contact.name),
      ]),
    );
  }
}
