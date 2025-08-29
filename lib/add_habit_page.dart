import 'package:flutter/material.dart';
import 'habit.dart';

class AddHabitPage extends StatefulWidget {
  @override
  _AddHabitPageState createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  final TextEditingController _controller = TextEditingController();

  void _saveHabit() {
    if (_controller.text.isNotEmpty) {
      final habit = Habit(name: _controller.text);
      Navigator.pop(context, habit);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nouvelle habitude")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Nom de l’habitude",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveHabit,
              child: Text("Ajouter"),
            )
          ],
        ),
      ),
    );
  }
}
