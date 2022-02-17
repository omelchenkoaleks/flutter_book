import 'package:flutter_book/base_model.dart';

class Note {
  int id = 0;
  String title = '';
  String content = '';
  String color = '';

  @override
  String toString() {
    return '{ id=$id, title=$title, }' 'content=$content, color=$color';
  }
}

class NotesModel extends BaseModel {
  // Needed to be able to display what the user picks in the Text widget on the entry screen.
  String color = '';


  // For display of the color chosen by the user.
  void setColor(String inColor) {

    print("## NotesModel.setColor(): inColor = $inColor");

    color = inColor;
    notifyListeners();

  }
}

// The one and only instance of this model.
NotesModel notesModel = NotesModel();

