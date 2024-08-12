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
          trailing: IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )),
    );
  }
}
