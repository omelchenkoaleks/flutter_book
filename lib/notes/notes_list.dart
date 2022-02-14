import 'package:flutter/material.dart';
import '../notes/notes_model.dart';

// mock
List<Note> notesList = [
  Note('one', 'one one one'),
  Note('two', 'two two two'),
  Note('three', 'three three three'),
  Note('four', 'four four four'),
  Note('five', 'five five five'),
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
            return Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Card(
                elevation: 8,
                child: ListTile(
                  title: Text(notesList[index].title),
                  subtitle: Text(notesList[index].content),
                  onTap: () {},
                ),
              ),
            );
          }),
    );
  }
}
