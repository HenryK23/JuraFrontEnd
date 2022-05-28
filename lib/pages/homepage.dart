import 'package:flutter/material.dart';
import 'package:noteapp/components/leftside.dart';
import 'package:noteapp/components/rightside.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Row(
        children: const [
          Material(elevation: 20, child: LeftSide()),
          RightSide()
        ],
      ),
    ));
  }
}
