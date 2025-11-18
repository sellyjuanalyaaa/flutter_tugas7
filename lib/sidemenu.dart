import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Admin User", style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text("admin@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('images/default.jpg'), // Pastikan gambar ada atau gunakan Icon
              child: Icon(Icons.person, color: Colors.indigo, size: 40),
            ),
            decoration: BoxDecoration(
              color: Colors.indigo,
              image: DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1557683316-973673baf926?auto=format&fit=crop&w=500&q=60"),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(context, Icons.dashboard_outlined, "Dashboard", '/home'),
                _buildMenuItem(context, Icons.person_outline, "Profile", '/profile'),
                _buildMenuItem(context, Icons.edit_note_outlined, "Catatan", '/notes'),
                _buildMenuItem(context, Icons.history, "Aktivitas", '/activity'),
                _buildMenuItem(context, Icons.settings_outlined, "Pengaturan", '/settings'),
                const Divider(),
                _buildMenuItem(context, Icons.info_outline, "Tentang", '/about'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton.icon(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text("Logout", style: TextStyle(color: Colors.red)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, String route) {
    final isSelected = ModalRoute.of(context)?.settings.name == route;
    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.indigo : Colors.grey[700]),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.indigo : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.indigo.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      onTap: () {
        Navigator.pop(context); // Tutup drawer dulu
        if (!isSelected) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
    );
  }
}