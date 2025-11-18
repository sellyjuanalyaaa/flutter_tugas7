import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prakflutter/sidemenu.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  List<String> notes = [];

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  Future<void> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => notes = prefs.getStringList("notes") ?? []);
  }

  Future<void> saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList("notes", notes);
  }

  void addNote() {
    TextEditingController c = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Tambah Catatan"),
        content: TextField(
          controller: c,
          decoration: const InputDecoration(hintText: "Tulis sesuatu..."),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            child: const Text("Batal"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text("Simpan"),
            onPressed: () {
              if (c.text.isNotEmpty) {
                setState(() => notes.add(c.text));
                saveNotes();
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catatan Saya")),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addNote,
        icon: const Icon(Icons.add),
        label: const Text("Baru"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: notes.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.note_alt_outlined, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text("Belum ada catatan", style: TextStyle(color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notes.length,
              itemBuilder: (_, i) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                color: Colors.yellow[50], // Efek sticky note
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: Text(
                    notes[i],
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () {
                      setState(() => notes.removeAt(i));
                      saveNotes();
                    },
                  ),
                ),
              ),
            ),
    );
  }
}