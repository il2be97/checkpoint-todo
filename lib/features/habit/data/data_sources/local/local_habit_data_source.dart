import 'package:checkpoint/features/habit/data/data_sources/local/hive/hive_local_habit_data_source.dart';
import 'package:checkpoint/features/habit/data/dtos/habit_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_habit_data_source.g.dart';

abstract class ILocalHabitDataSource {
  Future<List<HabitDTO>> read();
  Future<void> create(HabitDTO dto);
  Future<void> update(HabitDTO dto);
  Future<void> updateAll(List<HabitDTO> dtos);
  Future<void> delete(HabitDTO dto);
}

@riverpod
ILocalHabitDataSource localHabitDataSource(Ref ref) {
  return HiveLocalHabitDataSource();
}
