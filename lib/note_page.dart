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
        title: const Text("Catatan Baru"),
        content: TextField(controller: c),
        actions: [
          TextButton(
            child: const Text("Tambah"),
            onPressed: () {
              setState(() => notes.add(c.text));
              saveNotes();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catatan")),
      drawer: const AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: addNote,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(notes[i]),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() => notes.removeAt(i));
              saveNotes();
            },
          ),
        ),
      ),
    );
  }
}
