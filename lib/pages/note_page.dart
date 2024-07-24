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

  @override
  void initState() {
    super.initState();

    //on app startup, fetch existing notes
    readNotes();
  }

  //CREATE A NOTE
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

              //clear textcontroller
              textController.clear();
            },
            child: const Text('Create'),
          )
        ],
      ),
    );
  }

  //READ A NOTE
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //UPDATE A NOTE
  void updateNote(Note note) {
    //pre=fill the current note text
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(controller: textController),
        actions: [
          //update button
          MaterialButton(
            onPressed: () {
              //update note in db
              context
                  .read<NoteDatabase>()
                  .updateNotes(note.id, textController.text);
              //clear controller
              textController.clear();
              //pop dialog box
              Navigator.pop(context);
            },
            child: const Text('Update'),
          )

          //
        ],
      ),
    );
  }

  //DELETE A NOTE
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNotes(id);
  }

  @override
  Widget build(BuildContext context) {
    //note database
    final notedatabase = context.watch<NoteDatabase>();

    //current notes
    List<Note> currentNotes = notedatabase.currentNotes;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // title: const Center(child: Text('Notes')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          const Text('Notes'),
          Expanded(
            child: ListView.builder(
                itemCount: currentNotes.length,
                itemBuilder: (context, index) {
                  //get individual note
                  final note = currentNotes[index];

                  //return listTile UI
                  return ListTile(
                    title: Text(note.text),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //edit button
                        IconButton(
                          onPressed: () => updateNote(note),
                          icon: const Icon(Icons.edit),
                        ),

                        //delete button
                        IconButton(
                            onPressed: () => deleteNote(note.id),
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
