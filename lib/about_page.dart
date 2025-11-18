import 'package:flutter/material.dart';
import 'package:prakflutter/sidemenu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tentang Aplikasi")),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Aplikasi ini adalah demo routing + menu + local storage.", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
