import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../utils.dart' as utils;
import 'notes_model.dart';

class NotesDBWorker {
  NotesDBWorker._();

  static final NotesDBWorker db = NotesDBWorker._();

  Database? _db;

  Future get database async {
    _db ??= await init();

    print("## Notes NotesDBWorker.get-database(): _db = $_db");

    return _db;
  }

  Future<Database> init() async {
    print("Notes NotesDBWorker.init()");

    String path = join(utils.docsDir.path, 'notes.db');
    print("## notes NotesDBWorker.init(): path = $path");

    Database db = await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database inDB, int inVersion) async {
      await inDB.execute("CREATE TABLE IF NOT EXISTS notes ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT,"
          "content TEXT,"
          "color TEXT"
          ")");
    });
    return db;
  }

  Note noteFromMap(Map inMap) {

    print("## Notes NotesDBWorker.noteFromMap(): inMap = $inMap");

    Note note = Note();
    note.id = inMap["id"];
    note.title = inMap["title"];
    note.content = inMap["content"];
    note.color = inMap["color"];

    print("## Notes NotesDBWorker.noteFromMap(): note = $note");

    return note;
  }

  Map<String, dynamic> noteToMap(Note inNote) {

    print("## Notes NotesDBWorker.noteToMap(): inNote = $inNote");

    Map<String, dynamic> map = <String, dynamic>{};
    map["id"] = inNote.id;
    map["title"] = inNote.title;
    map["content"] = inNote.content;
    map["color"] = inNote.color;

    print("## notes NotesDBWorker.noteToMap(): map = $map");

    return map;
  }

  Future create(Note inNote) async {

    print("## Notes NotesDBWorker.create(): inNote = $inNote");

    Database db = await database;

    // Get largest current id in the table, plus one, to be the new ID.
    var val = await db.rawQuery("SELECT MAX(id) + 1 AS id FROM notes");
    int id = val.first["id"] as int;

    // Insert into table.
    return await db.rawInsert(
        "INSERT INTO notes (id, title, content, color) VALUES (?, ?, ?, ?)",
        [
          id,
          inNote.title,
          inNote.content,
          inNote.color
        ]
    );
  }

  Future<Note> get(int inID) async {

    print("## Notes NotesDBWorker.get(): inID = $inID");

    Database db = await database;
    var rec = await db.query("notes", where : "id = ?", whereArgs : [ inID ]);

    print("## Notes NotesDBWorker.get(): rec.first = $rec.first");

    return noteFromMap(rec.first);
  }

  Future update(Note inNote) async {

    print("## Notes NotesDBWorker.update(): inNote = $inNote");

    Database db = await database;
    return await db.update("notes", noteToMap(inNote), where : "id = ?", whereArgs : [ inNote.id ]);
  }

  Future delete(int inID) async {

    print("## Notes NotesDBWorker.delete(): inID = $inID");

    Database db = await database;
    return await db.delete("notes", where : "id = ?", whereArgs : [ inID ]);
  }
}
