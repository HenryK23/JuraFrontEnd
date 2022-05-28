import 'package:flutter/material.dart';
import 'package:noteapp/pages/homepage.dart';
import 'package:noteapp/providers/noteprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider.value(value: Notes())],
        child: MaterialApp(
          title: 'Juralio Notes',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Juralio Notes'),
        ));
  }
}
