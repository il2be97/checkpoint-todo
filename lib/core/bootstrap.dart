import 'package:checkpoint/core/storage/hive/hive_registrar.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> bootstrap() async {
  await Hive.initFlutter();
  Hive.registerAdapters();
  await EasyLocalization.ensureInitialized();
  await initializeDateFormatting();
}
