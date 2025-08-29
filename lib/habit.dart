class Habit {
  String name;
  bool isCompleted;
  int streak;
  DateTime? lastCompletedDate;

  Habit({
    required this.name,
    this.isCompleted = false,
    this.streak = 0,
    this.lastCompletedDate,
  });

  void toggleCompletion() {
    DateTime today = DateTime.now();

    if (!isCompleted) {
      // Marquer comme complétée
      if (lastCompletedDate != null) {
        // Si c'était hier → on augmente le streak
        if (lastCompletedDate!.difference(today).inDays == -1) {
          streak++;
        }
        // Si ce n'était pas hier → reset streak
        else if (lastCompletedDate!.day != today.day ||
            lastCompletedDate!.month != today.month ||
            lastCompletedDate!.year != today.year) {
          streak = 1;
        }
      } else {
        streak = 1;
      }

      isCompleted = true;
      lastCompletedDate = today;
    } else {
      // Décocher = perdre la complétion du jour
      isCompleted = false;
    }
  }

  bool isCompletedToday() {
    if (lastCompletedDate == null) return false;
    DateTime today = DateTime.now();
    return lastCompletedDate!.day == today.day &&
        lastCompletedDate!.month == today.month &&
        lastCompletedDate!.year == today.year &&
        isCompleted;
  }
}
