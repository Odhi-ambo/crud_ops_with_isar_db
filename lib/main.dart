import 'package:crud_isar_db/pages/note_page.dart';
import 'package:flutter/material.dart';

void main() {
  //initialize note isar db
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NotePage(),
    );
  }
}
