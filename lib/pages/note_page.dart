import 'package:crud_isar_db/components/drawer.dart';
import 'package:crud_isar_db/components/note_tile.dart';
import 'package:crud_isar_db/model/note.dart';
import 'package:crud_isar_db/model/note_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        backgroundColor: Theme.of(context).colorScheme.surface,
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
        backgroundColor: Theme.of(context).colorScheme.surface,
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
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        //title: const Center(child: Text('Notes')),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifText(
                  fontSize: 48,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: currentNotes.length,
                itemBuilder: (context, index) {
                  //get individual note
                  final note = currentNotes[index];

                  //return listTile UI
                  return NoteTile(
                    text: note.text,
                    onDeletePressed: () => deleteNote(note.id),
                    onEditPressed: () => updateNote(note),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
