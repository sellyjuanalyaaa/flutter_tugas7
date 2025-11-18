import 'package:flutter/material.dart';
import 'package:prakflutter/sidemenu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tentang Aplikasi")),
      drawer: const AppDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/default.jpg', width: 120, height: 120), // Ganti dengan logo app
              const SizedBox(height: 20),
              const Text("PrakFlutter App", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const Text("Versi 1.0.0", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 20),
              const Text(
                "Aplikasi ini dibuat untuk memenuhi Tugas 7 Praktikum Pemrograman Mobile. Mendukung fitur routing, local storage, dan manajemen menu.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}