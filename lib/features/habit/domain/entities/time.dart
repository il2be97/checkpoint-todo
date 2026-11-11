class Time {
  final int hour;
  final int minute;

  Time({required this.hour, required this.minute});

  factory Time.now() {
    final date = DateTime.now();
    return Time(hour: date.hour, minute: date.minute);
  }
}
