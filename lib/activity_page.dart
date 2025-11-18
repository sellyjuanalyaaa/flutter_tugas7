import 'package:flutter/material.dart';
import 'package:prakflutter/sidemenu.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  final logs = const [
    {"action": "Login berhasil", "time": "Baru saja", "icon": Icons.login},
    {"action": "Melihat Profile", "time": "5 menit yang lalu", "icon": Icons.person},
    {"action": "Menambah Catatan", "time": "1 jam yang lalu", "icon": Icons.edit},
    {"action": "Logout", "time": "Kemarin", "icon": Icons.logout},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log Aktivitas")),
      drawer: const AppDrawer(),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: logs.length,
        separatorBuilder: (ctx, i) => const Divider(height: 30),
        itemBuilder: (ctx, i) {
          final item = logs[i];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(item['icon'] as IconData, color: Colors.indigo, size: 20),
                  ),
                  if (i != logs.length - 1)
                    Container(
                      width: 2,
                      height: 40,
                      color: Colors.grey[300],
                      margin: const EdgeInsets.only(top: 4),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['action'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['time'] as String,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}