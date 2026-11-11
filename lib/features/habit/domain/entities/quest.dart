enum HabitIcons { book, sport, coding, language, heart, coffee }

enum HabitColors { lavender, green, orange, blue, red, pink }

class Habit {
  final String title;
  final String icon;
  final int streak;
  final int bestStreak;
  final int exp;
  final int totalDays;
  final bool completed;

  Habit({
    required this.title,
    required this.icon,
    required this.streak,
    required this.bestStreak,
    required this.exp,
    required this.totalDays,
    required this.completed,
  });
}
