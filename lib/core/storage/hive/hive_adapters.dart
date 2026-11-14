import 'package:checkpoint/core/models/time.dart';
import 'package:checkpoint/core/storage/hive/models/character_hive_model.dart';
import 'package:checkpoint/core/storage/hive/models/habit_hive_model.dart';
import 'package:hive_ce/hive_ce.dart';
part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<CharacterHiveModel>(),
  AdapterSpec<HabitHiveModel>(),
  AdapterSpec<Time>(),
])
class HiveAdapters {}
