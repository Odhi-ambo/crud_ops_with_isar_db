import 'package:crud_isar_db/model/note_database.dart';
import 'package:crud_isar_db/pages/note_page.dart';
import 'package:crud_isar_db/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  //initialize note isar db
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => NoteDatabase()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const NotePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
