import 'package:flutter/material.dart';

abstract final class AppTheme {
  static const Color _primaryColor = Color(0xFFF97316);
  static const Color _secondaryColor = Color(0xFF94A3B8);
  static const Color _surfaceBgColor = Color(0xFF10182B);
  static const Color _surfaceContainer = Color(0xFF1C293E);
  static const Color _outlineVariant = Color(0xFF344258);

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: _primaryColor,
      surface: _surfaceBgColor,
      surfaceContainer: _surfaceContainer,
      outlineVariant: _outlineVariant,
    ),
    dividerTheme: const DividerThemeData(
      color: _outlineVariant,
      space: .minPositive,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: _secondaryColor,
        letterSpacing: 1.2,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _surfaceBgColor,
      shadowColor: _surfaceBgColor,
      scrolledUnderElevation: 2,
      surfaceTintColor: Colors.transparent,
    ),
    tabBarTheme: TabBarThemeData(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: const Color(0xFF25344C),
        borderRadius: BorderRadius.circular(20),
      ),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey.shade400,
      dividerColor: Colors.transparent,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xFFFDBA74)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: _primaryColor,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: _primaryColor,
      linearTrackColor: Color(0xFF25344C),
      linearMinHeight: 6.0,
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
    navigationBarTheme: NavigationBarThemeData(
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),

      backgroundColor: _surfaceBgColor,
      indicatorColor: _primaryColor.withValues(alpha: 0.2),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        return states.isSelected
            ? const IconThemeData(color: _primaryColor)
            : const IconThemeData(color: _secondaryColor);
      }),

      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        return states.isSelected
            ? const TextStyle(
                color: _primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              )
            : const TextStyle(color: _secondaryColor, fontSize: 12);
      }),
    ),
  );
}

extension on Set<WidgetState> {
  bool get isSelected {
    return contains(WidgetState.selected);
  }
}
