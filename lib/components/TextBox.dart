import 'package:flutter/material.dart';
import 'package:noteapp/components/paperfield.dart';
import 'package:noteapp/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/noteprovider.dart';

class CustomTextBox extends StatelessWidget {
  const CustomTextBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width / 4) * 3;
    var height = MediaQuery.of(context).size.height;
    return Material(
      elevation: 15,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        width: width - 400,
        height: height - 300,
        child: Column(
          children: [
            SizedBox(
              width: width - 600,
              child: const Padding(
                padding: EdgeInsets.only(top: 150, left: 20, right: 20),
                child: PaperField(initialText: "New Note!"), // This is the text box here
              ),
            ),
            Container(
              width: width - 600,
              height: height - 850,
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    primary: primaryBlack,
                    shape: const CircleBorder()),
                onPressed: () {
                  //Edit note. Needs to first split the string by the lines they are in so it can take the first line
                  //Then shortens the message so to fit inside the button and then runs the edit note function within the provider
                  var temp = controller.text;
                  List<String> wordList = temp.split("\n");
                  if (wordList.isNotEmpty) {
                    temp = wordList[0].trim();
                    if (temp.length > 13) {
                      temp = temp.substring(0, 13);
                      temp = temp + "...";
                    }
                  } else {
                    temp = "no title";
                  }
                  DateTime now = DateTime.now();
                  var currentNote =
                      Provider.of<Notes>(context, listen: false).currentNote;
                  Provider.of<Notes>(context, listen: false).editNote(
                      currentNote,
                      temp,
                      DateFormat('dd/MM/yyyy - kk:mm').format(now),
                      controller.text);
                },
                child: const SizedBox(
                  width: 60,
                  height: 60,
                  child: Icon(
                    Icons.save,
                    size: 35,
                    color: primaryRed,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
