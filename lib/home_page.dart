import 'package:flutter/material.dart';
import 'habit.dart';
import 'add_habit_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Habit> habits = [];

  void _addHabit(Habit habit) {
    setState(() {
      habits.add(habit);
    });
  }

  void _toggleHabit(int index) {
    setState(() {
      habits[index].toggleCompletion();
    });
  }

  void _deleteHabit(int index) {
    setState(() {
      habits.removeAt(index);
    });
  }

  int get totalHabits => habits.length;

  int get completedToday =>
      habits.where((h) => h.isCompletedToday()).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HabiTrack"),
      ),
      body: Column(
        children: [
          // 🔹 Section Statistiques
          Card(
            margin: EdgeInsets.all(12),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text("Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("$totalHabits"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Complétées ajd",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text("$completedToday"),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // 🔹 Liste des habitudes
          Expanded(
            child: habits.isEmpty
                ? Center(child: Text("Aucune habitude pour l’instant"))
                : ListView.builder(
                    itemCount: habits.length,
                    itemBuilder: (context, index) {
                      final habit = habits[index];
                      return ListTile(
                        title: Text(habit.name),
                        subtitle:
                            Text("Streak : ${habit.streak} jours"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(
                                habit.isCompletedToday()
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank,
                              ),
                              onPressed: () => _toggleHabit(index),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () => _deleteHabit(index),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newHabit = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddHabitPage()),
          );
          if (newHabit != null) {
            _addHabit(newHabit);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
