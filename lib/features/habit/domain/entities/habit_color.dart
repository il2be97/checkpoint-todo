enum HabitColor {
  lavender,
  green,
  orange,
  blue,
  red,
  pink;

  factory HabitColor.from(String value) => values.firstWhere(
    (color) => color.name == value,
    orElse: () => .lavender,
  );
}
