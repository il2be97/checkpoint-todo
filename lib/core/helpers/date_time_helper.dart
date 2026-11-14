extension DateOnlyX on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  DateTime get nextDay => DateTime(year, month, day + 1);

  int daysTo(DateTime other) {
    final utcFrom = DateTime.utc(year, month, day);
    final utcTo = DateTime.utc(other.year, other.month, other.day);
    return utcTo.difference(utcFrom).inDays;
  }
}

extension DateOptionalX on DateTime? {
  bool isSameDay(DateTime other) => this?.isSameDay(other) ?? false;
}
