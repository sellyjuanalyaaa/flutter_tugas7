import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () => Navigator.pushReplacementNamed(context, '/home'),
          ),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () => Navigator.pushReplacementNamed(context, '/profile'),
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () => Navigator.pushReplacementNamed(context, '/settings'),
          ),

          ListTile(
            leading: const Icon(Icons.list),
            title: const Text("Activity Log"),
            onTap: () => Navigator.pushReplacementNamed(context, '/activity'),
          ),

          ListTile(
            leading: const Icon(Icons.note),
            title: const Text("Notes"),
            onTap: () => Navigator.pushReplacementNamed(context, '/notes'),
          ),

          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            onTap: () => Navigator.pushReplacementNamed(context, '/about'),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
    );
  }
}
