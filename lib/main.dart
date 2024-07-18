import 'package:crud_isar_db/model/note_database.dart';
import 'package:crud_isar_db/pages/note_page.dart';
import 'package:flutter/material.dart';

void main() async {
  //initialize note isar db
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NotePage(),
    );
  }
}
