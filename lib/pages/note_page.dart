import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});
  //create a note
  void createNote() {}

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
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
