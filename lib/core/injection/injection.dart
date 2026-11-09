import 'package:checkpoint/features/dashboard/dashboard_injection.dart';
import 'package:checkpoint/features/habit/habit_injection.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> configureDependencies() async {
  await Future.wait([injectDashboard(sl), injectHabit(sl)]);
}
