import 'package:cat_gpt/app/features/cats/cats_providers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppTheme {
  final MaterialColor primarySwatch;

  AppTheme(this.primarySwatch);

  /// for getting light theme
  ThemeData get lightTheme {
    return ThemeData(
        fontFamily: GoogleFonts.singleDay().fontFamily,
        primaryColor: primarySwatch[200]);
  }

  /// for getting dark theme
  ThemeData get darkTheme {
    //
    return ThemeData();
  }
}

/// for providing app theme [AppTheme]
final appThemeProvider = StateProvider<AppTheme>((ref) {
  final cats = ref.watch(catsProvider);
  final theme = AppTheme(cats.color);
  return theme;
});
