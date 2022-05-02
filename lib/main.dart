import 'package:contact_list/list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({super.key});

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
            home: const ListPage(),
          );
        });
  }
}
