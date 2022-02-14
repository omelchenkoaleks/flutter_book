import 'package:flutter/material.dart';
import 'package:flutter_book/appointments/appointments_list.dart';
import 'package:flutter_book/contacts/contacts_list.dart';
import 'package:flutter_book/notes/notes_list.dart';
import 'package:flutter_book/tasks/tasks_list.dart';

void main() {
  runApp(const FlutterBook());
}

class FlutterBook extends StatelessWidget {
  const FlutterBook({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("## FlutterBook.build()");

    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Book'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.date_range), text: "Appointments"),
                Tab(icon: Icon(Icons.contacts), text: "Contacts"),
                Tab(icon: Icon(Icons.note), text: "Notes"),
                Tab(icon: Icon(Icons.assignment_turned_in), text: "Tasks"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              AppointmentsList(),
              ContactsList(),
              NotesList(),
              TasksList(),
            ],
          ),
        ),
      ),
    );
  }
}
