import 'package:checkpoint/core/models/time.dart';
import 'package:flutter/material.dart';

extension TimeX on Time {
  TimeOfDay toTimeOfDay() => TimeOfDay(hour: hour, minute: minute);
}
