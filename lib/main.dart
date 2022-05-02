import 'package:contact_list/list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'N Contacts',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListPage());
  }
}
