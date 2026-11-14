enum HabitIcon {
  book,
  sport,
  coding,
  language,
  heart,
  coffee;

  factory HabitIcon.from(String value) =>
      values.firstWhere((icon) => icon.name == value, orElse: () => .book);
}
