import 'package:contact_list/contact.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  final void Function(Contact contact) onSubmit;
  const AddPage({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Contact")),
    );
  }
}
