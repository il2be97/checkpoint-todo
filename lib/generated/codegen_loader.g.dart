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
    "title": "Defend your streak.",
    "level_peasant": "Level {level} Peasant",
    "level_ragged_knight": "Level {level} Ragged Knight",
    "level_steel_knight": "Level {level} Steel Knight",
    "level_veteran_paladin": "Level {level} Veteran Paladin",
    "level_grandmaster": "Level {level} Grandmaster",
    "total_streak": "total active streaks",
    "total_streak_on_fire": "on fire",
    "exp": "{exp} HP",
    "exp_to_next_level": "{current} XP to level {level}",
    "unknown": "Unknown",
    "hp_status": "{current}/{max} HP • Stay in the game",
    "todays_missions": "Today's missions"
  },
  "habits": {
    "subtitle": "keep the flame",
    "title": "My Habits",
    "tab": {
      "active": "Active",
      "archived": "Archived"
    },
    "active": {
      "hint_title": "Start small. A few minutes a day is enough.",
      "hint_button": "Back to Home"
    },
    "archived": {
      "hint_title": "Restoring a habit moves it back to Active. Your previous check-ins stay saved."
    }
  },
  "empty_card": {
    "open_habits": {
      "title": "No Quest Active Yet",
      "subtitle": "Your knight is resting. Go to the Habits tab to create your first daily routine and protect your HP!",
      "button": "Go to Habits"
    },
    "create_habits": {
      "title": "Your first quest starts here",
      "subtitle": "Build a routine, one small habit at a time. Complete daily quests to earn XP and evolve your knight.",
      "button": "+ Create First Habit"
    },
    "archive_habits": {
      "title": "No archived quests yet",
      "subtitle": "Taking a break from a habit? Archive it to keep your progress safe. Restore it whenever you’re ready.",
      "button": "View Active Habits"
    }
  },
  "create_habit": {
    "title": "Create Habit",
    "subtitle": "One small habit. A stronger knight.",
    "placeholder_title": "Habit Name",
    "placeholder": "e.g. Read for 20 minutes",
    "icon_title": "Habit Icon",
    "color_title": "Accent Color",
    "notifification_title": "Notification Time",
    "notification_hint": "A little nudge before your daily reset.",
    "hint": "A little nudge before your daily reset.",
    "every_day": "Every day",
    "cancel": "Cancel",
    "save": "Save Habit",
    "colors": {
      "lavender": "lavender",
      "green": "green",
      "orange": "orange",
      "blue": "blue",
      "red": "red",
      "pink": "pink"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en};
}
