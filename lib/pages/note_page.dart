import 'package:crud_isar_db/model/note_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotePage extends StatelessWidget {
  final textController = TextEditingController();

  NotePage({super.key});
  //create a note
  void createNote() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                MaterialButton(onPressed: () {
                  context.read<NoteDatabase>().addNote(textController.text);
                })
              ],
            ));
  }

  //read a note

  //update a note

  //delete a note

  @override
  Widget build(BuildContext context) {
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
