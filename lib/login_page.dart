import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final user = TextEditingController();
  final pass = TextEditingController();

  Future<void> login() async {
    if (user.text == "admin" && pass.text == "admin") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool("loggedIn", true);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login gagal")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(controller: user, decoration: const InputDecoration(labelText: "Username")),
              TextField(controller: pass, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: login, child: const Text("Masuk")),
            ],
          ),
        ),
      ),
    );
  }
}
