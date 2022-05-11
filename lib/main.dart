import 'package:contact_list/contact.dart';
import 'package:contact_list/list_page.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  final LocalStorage storage = LocalStorage('data');

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'N Contacts',
            theme: ThemeData(primarySwatch: Colors.indigo),
            darkTheme: ThemeData.dark(),
            themeMode: currentMode,
            home: FutureBuilder(future: storage.ready, builder: futureBuild),
          );
        });
  }

  Widget futureBuild(BuildContext context, AsyncSnapshot<bool> snapshot) {
    if (snapshot.data == true) {
      List<dynamic>? data = storage.getItem('contacts');

      if (data == null) {
        storage.setItem('contacts', []).then((value) => {});
        data = [];
      }

      return ListPage(
          contacts: List.from(data.map((json) => Contact.fromJson(json))));
    }
    return const CircularProgressIndicator.adaptive();
  }
}
