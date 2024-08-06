import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final void Function()? onDeletePressed;
  final void Function()? onEditPressed;
  final String text;
  const NoteTile(
      {super.key,
      required this.text,
      required this.onEditPressed,
      required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 10, left: 24, right: 25),
      child: ListTile(
        title: Text(text),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onEditPressed,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: onDeletePressed,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
