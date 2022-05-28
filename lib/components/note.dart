import 'package:flutter/material.dart';
import 'package:noteapp/components/paperfield.dart';
import 'package:noteapp/providers/noteprovider.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';

class Note extends StatelessWidget {
  //This is a scaffold for a single note that sits on the left side. This get created for each note by the listview builder in notebuilder.dart
  int? index;
  String? noteTitle;
  String? noteTimestamp;
  String? noteContent;
  int? noteIndex;

  Note(
      {Key? key,
      this.noteTitle,
      this.noteTimestamp,
      this.noteContent,
      this.index,
      this.noteIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentNote = 0;

    try {
      currentNote = Provider.of<Notes>(context)
          .getCurrentNote(); //need to get the current note to see which one to highlight the button colour for
    } catch (e) {}
    return Container(
      height: 100,
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary:
                currentNote == noteIndex ? primaryBlackSelected : primaryBlack,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          controller.text = noteContent!;
          Provider.of<Notes>(context, listen: false).setCurrentNote(
              noteIndex!); //sets the current note to the one selected so when saved it knows which one to update
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    noteTimestamp!,
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 5),
                  child: Text(
                    noteTitle!,
                    style: const TextStyle(color: Colors.white, fontSize: 21),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, right: 10),
              child: IconButton(
                //Delete note button uses the provider function
                padding: EdgeInsets.zero,
                onPressed: () {
                  Provider.of<Notes>(context, listen: false).deleteNote(index!);
                },
                icon: const Icon(
                  Icons.delete,
                  color: primaryRed,
                  size: 45,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
