import 'package:contact_list/add_page.dart';
import 'package:contact_list/contact.dart';
import 'package:contact_list/contact_widget.dart';
import 'package:contact_list/main.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  final List<Contact> contacts;
  const ListPage({Key? key, required this.contacts}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late List<Contact> contacts;

  void addToList(Contact contact) {
    setState(() {
      contacts.add(contact);
    });
  }

  @override
  void initState() {
    super.initState();
    contacts = widget.contacts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("N Contacts"), actions: [
        IconButton(
            icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode),
            tooltip: MyApp.themeNotifier.value == ThemeMode.light
                ? "Switch to dark mode"
                : "Switch to light mode",
            onPressed: () {
              setState(() {
                MyApp.themeNotifier.value =
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
              });
            })
      ]),
      body: Stack(children: [
        ListView(
            children: List.from(
                contacts.map((item) => ContactWidget(contact: item)))),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(28)),
              child: IconButton(
                  icon: const Icon(Icons.person_add),
                  tooltip: "Add contact",
                  color: Theme.of(context).primaryIconTheme.color,
                  onPressed: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => AddPage(onSubmit: addToList)));
                    });
                  }),
            ),
          ),
        )
      ]),
    );
  }
}
