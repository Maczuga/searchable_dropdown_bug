import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dropdown_search bug',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Body(),
    );
  }
}

class Body extends StatelessWidget {
  final dropdownKey = GlobalKey<DropdownSearchState<int>>();

  Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  label: Text("Press me and then 'next' action on the keyboard")),
            ),
            Focus(
              onFocusChange: (value) {
                dropdownKey.currentState?.openDropDownSearch();
              },
              child: DropdownSearch<int>(
                key: dropdownKey,
                items: const [1, 2, 3, 4, 5],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
