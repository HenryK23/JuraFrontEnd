import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:noteapp/model/note.dart';

class Notes with ChangeNotifier {
  int autoIndex = 0;
  List<NoteModel> noteList = [];

  int currentNote = 0;

  void setCurrentNote(int num) {
    currentNote = num;
    notifyListeners();
  }

  int getCurrentNote() {
    return currentNote;
  }

  void fetchAndSetNotes() {}

  void addNote(String title, String timestamp, String content) {
    noteList.add(NoteModel(
        title: title,
        timestamp: timestamp,
        content: content,
        index: autoIndex++));
    notifyListeners();
  }

  void deleteNote(int index) {
    noteList.removeAt(index);
    notifyListeners();
  }

  void editNote(int index, String title, String timestamp, String content) {
    int n = noteList.indexWhere((element) => element.index == index);

    noteList[n].title = title;
    noteList[n].content = content;
    noteList[n].timestamp = timestamp;

    notifyListeners();
  }
}
