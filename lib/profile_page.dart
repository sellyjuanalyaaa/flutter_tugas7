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
      appBar: AppBar(title: const Text("Profile")),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: avatarPath != null
                  ? FileImage(File(avatarPath!))
                  : const AssetImage('assets/default.png'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickImage,
              child: const Text("Ganti Avatar"),
            ),
          ],
        ),
      ),
    );
  }
}
