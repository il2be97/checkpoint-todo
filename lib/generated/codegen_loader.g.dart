// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "nav": {
    "home": "Home",
    "habits": "Habits"
  },
  "home": {
    "title": "Keep your orbit",
    "level_beginner": "Level {level} Beginner",
    "level_explorer": "Level {level} Explorer",
    "total_streak": "total active streaks",
    "total_streak_on_fire": "on fire",
    "exp": "{exp} HP",
    "exp_to_next_level": "{current} XP to level {level}",
    "unknown": "Unknown",
    "hp_status": "{current}/{max} HP • Stay in the game",
    "todays_missions": "Today's missions",
    "empty": "No mission available"
  },
  "habits": {
    "subtitle": "BUILD YOUR ORBIT",
    "title": "My Habits",
    "tab": {
      "active": "Active",
      "archived": "Archived"
    },
    "empty": "No mission available"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en};
}
