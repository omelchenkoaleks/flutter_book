import 'package:flutter/material.dart';
import '../notes/notes_model.dart';

// mock
List<Note> notesList = [
  Note(1, 'one', 'one one one', 'white'),
  Note(2, 'two', 'two two two', 'red'),
  Note(3, 'three', 'three three three', 'green'),
  Note(4, 'four', 'four four four', 'blue'),
  Note(5, 'five', 'five five five', 'yellow'),
  Note(6, 'six', 'six six six', 'grey'),
  Note(7, 'seven', 'seven', 'white'),
];

class NotesList extends StatelessWidget {
  const NotesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("## NotesList.build()");

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      body: ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (context, int index) {
            Color color = Colors.white;
            switch (notesList[index].color) {
              case "red" :
                color = Colors.red;
                break;
              case "green" :
                color = Colors.green;
                break;
              case "blue" :
                color = Colors.blue;
                break;
              case "yellow" :
                color = Colors.yellow;
                break;
              case "grey" :
                color = Colors.grey;
                break;
              case "purple" :
                color = Colors.purple;
                break;
            }
            return Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Card(
                elevation: 8,
                color: color,
                child: ListTile(
                  title: Text(notesList[index].title),
                  subtitle: Text(notesList[index].content),
                  onTap: () {
                    _deleteNote(context, notesList[index]);
                  },
                ),
              ),
            );
          }),
    );
  }

  Future _deleteNote(BuildContext inContext, Note note) {
    print("## NotesList._deleteNote(): Note = $note");

    return showDialog(
      context: inContext,
      builder: (BuildContext inAlertContext) {
        return AlertDialog(
          title : const Text("Delete Note"),
          content : Text("Are you sure you want to delete ${note.title}?"),
          actions: [
            TextButton(child : const Text("Cancel"),
                onPressed: () {
                  // Just hide dialog.
                  Navigator.of(inAlertContext).pop();
                }
            ),
            TextButton(child : const Text("Delete"),
                onPressed : ()  {
                  notesList.remove(note);
                  Navigator.of(inAlertContext).pop();
                  Scaffold.of(inContext).showSnackBar(
                      const SnackBar(
                          backgroundColor : Colors.red,
                          duration : Duration(seconds : 2),
                          content : Text("Note deleted")
                      )
                  );
                }
            ),
          ],
        );
      }
    );

  }

}
