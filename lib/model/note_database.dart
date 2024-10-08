import 'package:crud_isar_db/model/note.dart';
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;
  //initialize db
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }

  //list of notes
  final List<Note> currentNotes = [];

  //create
  Future<void> addNote(String textFromUser) async {
    //create a new note object
    final newNote = Note()..text = textFromUser;

    //save a note to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    //re-read from db
    fetchNotes();
  }

  //read - notes from db
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  //update
  Future<void> updateNotes(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  //delete
  Future<void> deleteNotes(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
