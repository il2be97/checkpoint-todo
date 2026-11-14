import 'package:checkpoint/core/storage/hive/models/habit_hive_model.dart';
import 'package:checkpoint/features/habit/data/data_sources/local/hive/mapper/hive_habit_mapper.dart';
import 'package:checkpoint/features/habit/data/data_sources/local/local_habit_data_source.dart';
import 'package:checkpoint/features/habit/data/dtos/habit_dto.dart';
import 'package:hive_ce/hive.dart';

class HiveLocalHabitDataSource extends ILocalHabitDataSource {
  Future<Box<HabitHiveModel>> _getBox() async =>
      Hive.openBox<HabitHiveModel>('habitsBox');

  @override
  Future<List<HabitDTO>> read() async {
    final box = await _getBox();
    return box.values.map((habit) => habit.toDTO()).toList();
  }

  @override
  Future<void> create(HabitDTO dto) async {
    final box = await _getBox();
    await box.put(dto.id, dto.toHive());
  }

  @override
  Future<void> update(HabitDTO dto) async {
    final box = await _getBox();
    await box.put(dto.id, dto.toHive());
  }

  @override
  Future<void> delete(HabitDTO dto) async {
    final box = await _getBox();
    await box.delete(dto.id);
  }

  @override
  Future<void> updateAll(List<HabitDTO> dtos) async {
    final box = await _getBox();
    final entries = {for (final dto in dtos) dto.id: dto.toHive()};
    await box.putAll(entries);
  }
}
