import 'package:crud_isar_db/model/note.dart';
import 'package:crud_isar_db/model/note_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final textController = TextEditingController();

  //create a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            //create button
            onPressed: () {
              //add to db
              context.read<NoteDatabase>().addNote(textController.text);

              //pop the dialog box
              Navigator.pop(context);
            },
            child: const Text('Create'),
          )
        ],
      ),
    );
  }

  //read a note
  void readNotes() {
    context.watch<NoteDatabase>().fetchNotes();
  }
  //update a note

  //delete a note

  @override
  Widget build(BuildContext context) {
    //note database
    final notedatabase = context.watch<NoteDatabase>();

    //current notes
    List<Note> currentNotes = notedatabase.currentNotes;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Center(child: Text('Notes')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
