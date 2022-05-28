import 'package:flutter/material.dart';
import 'package:noteapp/components/logo.dart';
import 'package:noteapp/components/notebuilder.dart';
import 'package:noteapp/utils/constants.dart';

class LeftSide extends StatelessWidget {
  const LeftSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 4;
    var height = MediaQuery.of(context).size.height;

    return Container(
        //Setting up width of side
        color: primaryRed,
        width: width,
        height: height,

        //Column down left side logo with black background then the list of notes with red background
        child: Column(
          children: [Logo(), NotesList()],
        )); 
  }
}
