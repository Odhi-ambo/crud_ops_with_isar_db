import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Notes')),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
