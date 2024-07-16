import 'package:crud_isar_db/model/note.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase {
  static late Isar isar;
  //initialize db
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [NoteSchema],
      directory: dir.path,
    );
  }
  //list of notes
  final List<Note> currentNotes = [];

  //create
  Future<void> addNote(String textFromUser) async{
    
  }

  //read

  //update

  //delete
}
