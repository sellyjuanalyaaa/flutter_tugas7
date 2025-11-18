import 'package:flutter/material.dart';
import 'package:prakflutter/sidemenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text("Selamat datang di Home Page!", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
