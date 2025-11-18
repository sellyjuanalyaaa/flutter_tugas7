import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prakflutter/sidemenu.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool notif = true;
  bool dark = false;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      notif = prefs.getBool("notif") ?? true;
      dark = prefs.getBool("dark") ?? false;
    });
  }

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("notif", notif);
    prefs.setBool("dark", dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      drawer: const AppDrawer(),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("Notifikasi"),
            value: notif,
            onChanged: (v) {
              setState(() => notif = v);
              save();
            },
          ),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: dark,
            onChanged: (v) {
              setState(() => dark = v);
              save();
            },
          ),
        ],
      ),
    );
  }
}
