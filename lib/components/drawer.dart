import 'package:crud_isar_db/components/drawer_tile.dart';
import 'package:crud_isar_db/pages/settings_page.dart';
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
          const DrawerHeader(
            child: Icon(Icons.edit),
          ),
          const SizedBox(
            height: 25,
          ),
          //notes title
          DrawerTile(
            leading: const Icon(Icons.home),
            title: 'Notes',
            onTap: () => Navigator.pop(context),
          ),
          DrawerTile(
              leading: const Icon(Icons.settings),
              title: 'Settings',
              onTap: () {
                //pop
                Navigator.pop(context);

                //navigate to settings page
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              })

          //notes settings
        ],
      ),
    );
  }
}
