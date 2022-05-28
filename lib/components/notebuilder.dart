import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/components/paperfield.dart';
import 'package:provider/provider.dart';

import '../providers/noteprovider.dart';
import '../utils/constants.dart';
import 'note.dart';

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(
      context,
    ).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: ElevatedButton( //Adds new note with new note! as its content and title
            style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                primary: primaryBlack,
                shape: const CircleBorder()),
            onPressed: () {
              DateTime now = DateTime.now();
              if (controller.text.length > 15) {
              }
              Provider.of<Notes>(context, listen: false).addNote("New Note!",
                  DateFormat('dd/MM/yyyy - kk:mm').format(now), "New Note!");
            },
            child: const Icon(
              Icons.add,
              size: 50,
              color: primaryBlue,
            ),
          ),
        ),
        SizedBox(
            height: height - 210,
            child: Consumer<Notes>( //this builds the notes from the note list inside the provider and for each note in there it creates the Note() widget 
                builder: (context, noteData, child) => ListView.builder( 
                    itemCount: noteData.noteList.length,
                    itemBuilder: ((
                      context,
                      index,
                    ) =>
                        Note(
                          noteTitle: noteData.noteList[index].title,
                          noteTimestamp: noteData.noteList[index].timestamp,
                          noteContent: noteData.noteList[index].content,
                          noteIndex: noteData.noteList[index].index,
                          index: index,
                        ))))),
      ],
    );
  }
}
