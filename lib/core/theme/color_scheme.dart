import 'package:checkpoint/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

extension AppColorSchemeExtension on ColorScheme {
  Color get surfaceAction => const Color(0xFF29384E);
  Color get surfaceSelected => const Color(0xFF29354C);
  Color get primaryLight => const Color(0xFFFB923C);
  Color get primaryText => const Color(0xFFFFB579);
  Color get positive => AppColors.success;
  Color get onSuccessContainer => const Color(0xFF6EE7B7);
  Color get warning => AppColors.error;
  Color get textSubtle => const Color(0xFF74849D);
  Color get textSecondary => const Color(0xFFCBD5E1);
  Color get textMuted => const Color(0xFF94A3B8);
}
