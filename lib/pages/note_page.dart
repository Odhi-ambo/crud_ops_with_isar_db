import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Notes')),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
