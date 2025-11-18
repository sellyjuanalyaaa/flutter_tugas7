import 'package:flutter/material.dart';
import 'package:prakflutter/sidemenu.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  final logs = const [
    "Login berhasil",
    "Membuka Home",
    "Melihat Profile",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Activity Log")),
      drawer: const AppDrawer(),
      body: ListView(
        children: logs.map((e) => ListTile(title: Text(e))).toList(),
      ),
    );
  }
}
