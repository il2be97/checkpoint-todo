import 'package:checkpoint/core/error/app_error.dart';
import 'package:checkpoint/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class CharacterNotFoundError extends AppError {
  @override
  String get message => LocaleKeys.errors_character_not_found.tr();
}
