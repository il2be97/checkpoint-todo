import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';

@freezed
abstract class Time with _$Time {
  const Time._();

  const factory Time({required int hour, required int minute}) = _Time;

  factory Time.now() {
    final date = DateTime.now();
    return _Time(hour: date.hour, minute: date.minute);
  }
}
