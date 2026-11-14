import 'package:checkpoint/core/models/time.dart';
import 'package:material_ui/material_ui.dart';

extension TimeX on Time {
  TimeOfDay toTimeOfDay() => TimeOfDay(hour: hour, minute: minute);
}
