import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prakflutter/sidemenu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? avatarPath;

  @override
  void initState() {
    super.initState();
    loadAvatar();
  }

  Future<void> loadAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => avatarPath = prefs.getString("avatar"));
  }

  Future<void> pickImage() async {
    final pick = ImagePicker();
    final file = await pick.pickImage(source: ImageSource.gallery);
    
    if (file != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("avatar", file.path);
      setState(() => avatarPath = file.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Profile")),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: avatarPath != null
                      ? FileImage(File(avatarPath!))
                      : const AssetImage('images/default.jpg') as ImageProvider,
                  child: avatarPath == null ? const Image(image: AssetImage('images/default.jpg')) : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.indigo,
                    radius: 20,
                    child: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                      onPressed: pickImage,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Admin User", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("Administrator", style: TextStyle(color: Colors.grey, fontSize: 16)),
            const SizedBox(height: 30),
            
            // Info Card
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade200)
              ),
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.indigo),
                    title: Text("Email"),
                    subtitle: Text("admin@example.com"),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.indigo),
                    title: Text("Telepon"),
                    subtitle: Text("+62 812 3456 7890"),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.location_on, color: Colors.indigo),
                    title: Text("Alamat"),
                    subtitle: Text("Jakarta, Indonesia"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}