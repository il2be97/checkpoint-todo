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
    "habits": "Habits",
    "settings": "Settings"
  },
  "home": {
    "title": "Defend your streak.",
    "subtitle": "a new day. a new quest.",
    "level_peasant": "Level {level} Peasant",
    "level_ragged_knight": "Level {level} Ragged Knight",
    "level_steel_knight": "Level {level} Steel Knight",
    "level_veteran_paladin": "Level {level} Veteran Paladin",
    "level_grandmaster": "Level {level} Grandmaster",
    "total_streak": "total active streaks",
    "total_streak_begin": "ready to begin",
    "total_streak_on_fire": "on fire",
    "exp": "{exp} HP",
    "exp_to_next_level": "{remain} XP to level {level}",
    "unknown": "Unknown",
    "hp_status": "{current}/{max} HP • Stay in the game",
    "todays_missions": "Today's quests",
    "todays_completed_info": "{completed} of {general} complete",
    "best_streak": "Best: {streak}",
    "total_info": "Total {days} days",
    "exp_reward": "+{exp} XP",
    "check_in": "Check in",
    "done": "Done",
    "empty_habits": {
      "title": "No Quest Active Yet",
      "subtitle": "Your knight is resting. Go to the Habits tab to create your first daily routine and protect your HP!",
      "button": "Go to Habits"
    },
    "complete_hint": "Complete before end of the day to save 1 HP",
    "evolution": {
      "title": "Knight evolution",
      "next": {
        "title": "Your knight’s evolution",
        "subtitle": "{next_tier} unlocks at level {level}"
      },
      "max": {
        "title": "Maximum level reached",
        "subtitle": "Your knight is fully evolved",
        "info": "Max"
      }
    }
  },
  "habits": {
    "subtitle": "keep the flame",
    "title": "My Habits",
    "tab": {
      "active": "Active",
      "archived": "Archived"
    },
    "active": {
      "empty": {
        "title": "Your first quest starts here",
        "subtitle": "Build a routine, one small habit at a time. Complete daily quests to earn XP and evolve your knight.",
        "button": "+ Create First Habit"
      },
      "daily_routine_title": "your daily routine",
      "daily_routine_count": "{count} on for today",
      "cell": {
        "streak_days": "Days",
        "on_for_today": "On for today"
      },
      "hint_title": "Start small. A few minutes a day is enough.",
      "hint_button": "Back to Home"
    },
    "archived": {
      "empty": {
        "title": "No archived quests yet",
        "subtitle": "Taking a break from a habit? Archive it to keep your progress safe. Restore it whenever you’re ready.",
        "button": "View Active Habits"
      },
      "title": "Your quests, on pause",
      "subtitle": "{count} archived habits · Your progress is saved.",
      "hint_title": "Restoring a habit moves it back to Active. Your previous check-ins stay saved.",
      "status": "Archived",
      "info": "Archived {date} · {streak} check-ins saved",
      "restore": "Restore Habit"
    }
  },
  "evolution": {
    "title": "Knight Evolution",
    "subtitle": "the path of the flame",
    "tip": "Build your streaks. Become a legend.",
    "unlocked": "lv {min}–{max}  ·  unlocked",
    "current": "lv {min}–{max}  ·  current",
    "locked": "lv {min}–{max}  ·  locked",
    "max_current": "lv {lvl}+  ·  current",
    "max_locked": "lv {lvl}+  ·  locked"
  },
  "habit_popup": {
    "create_title": "Create Habit",
    "edit_title": "Edit Habit",
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
    "save": "Save Habit"
  },
  "habit": {
    "colors": {
      "lavender": "lavender",
      "green": "green",
      "orange": "orange",
      "blue": "blue",
      "red": "red",
      "pink": "pink"
    }
  },
  "habit_options": {
    "title": "Habit options",
    "subtitle": "Manage this habit and its saved progress.",
    "edit": {
      "title": "Edit habit",
      "subtitle": "Change name, goal, schedule or reminder."
    },
    "archive": {
      "title": "Archive habit",
      "subtitle": "Keep your progress. Restore anytime."
    },
    "delete": {
      "title": "Delete habit",
      "subtitle": "Permanently remove this habit and history."
    },
    "cancel": "Cancel",
    "character": {
      "peasant": "Peasant",
      "peasant_description": "Ragged clothes · Wooden stick",
      "ragged": "Ragged Knight",
      "ragged_description": "Dented iron armor · Rusted sword",
      "steel": "Steel Knight",
      "steel_description": "Polished plate armor · Solid sword",
      "veteran": "Veteran Paladin",
      "veteran_description": "Silver & gold armor · Glowing cape",
      "grandmaster": "Grandmaster",
      "grandmaster_description": "Divine crystal armor · Ethereal aura"
    }
  },
  "character_info_card": {
    "description": "Level {level} · {current_exp} / {new_level_exp} XP",
    "moto": "Keep the flame alive."
  },
  "settings": {
    "title": "Settings",
    "subtitle": "your quest, your rules",
    "reminders": {
      "title": "reminders & survival",
      "daily": {
        "title": "Daily reminders",
        "subtitle": "A nudge to keep your quests alive"
      },
      "hp_rist": {
        "title": "HP at-risk alerts",
        "subtitle": "Get warned before losing a heart"
      }
    },
    "support": {
      "title": "support",
      "help": {
        "title": "Help & quest guide"
      },
      "privacy": {
        "title": "Privacy & data"
      }
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en};
}
