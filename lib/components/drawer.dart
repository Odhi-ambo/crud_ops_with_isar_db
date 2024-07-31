import 'package:crud_isar_db/components/drawer_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //header
          DrawerHeader(
            child: Icon(Icons.note),
          ),
          //notes title
          DrawerTile(
            leading: Icon(Icons.note),
            title: 'Notes',
            onTap: () {},
          )

          //notes settings
        ],
      ),
    );
  }
}
