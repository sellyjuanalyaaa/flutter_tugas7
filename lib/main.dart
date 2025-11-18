import 'package:flutter/material.dart';
import 'package:prakflutter/login_page.dart';
import 'package:prakflutter/home_page.dart';
import 'package:prakflutter/about_page.dart';
import 'package:prakflutter/profile_page.dart';
import 'package:prakflutter/setting_page.dart';
import 'package:prakflutter/activity_page.dart';
import 'package:prakflutter/note_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Menu',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
        '/about': (_) => const AboutPage(),
        '/profile': (_) => const ProfilePage(),
        '/settings': (_) => const SettingPage(),
        '/activity': (_) => const ActivityPage(),
        '/notes': (_) => const NotePage(),
      },
    );
  }
}
