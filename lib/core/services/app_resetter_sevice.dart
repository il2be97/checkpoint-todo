import 'package:checkpoint/core/navigation/app_router.dart';
import 'package:hive_ce/hive.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_resetter_sevice.g.dart';

@Riverpod(keepAlive: true)
class AppResetterService extends _$AppResetterService {
  @override
  Key build() => UniqueKey();

  Future<void> reset() async {
    await Hive.deleteFromDisk();
    state = UniqueKey();
    ref.invalidate(goRouterProvider);
  }
}
