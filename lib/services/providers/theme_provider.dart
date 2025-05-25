import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../local_storage_manager.dart';

class ThemeController extends StateNotifier<ThemeMode> {
  ThemeController() : super(ThemeMode.system) {
    _initialize();
  }

  bool get isDarkTheme => state == ThemeMode.dark;

  void _initialize() {
    final isPreviouslyDarkTheme = LocalStorageManager.getBool('isDarkTheme');
    if (isPreviouslyDarkTheme != null) {
      state = isPreviouslyDarkTheme ? ThemeMode.dark : ThemeMode.light;
    }
  }

  void toggleTheme() {
    state = isDarkTheme ? ThemeMode.light : ThemeMode.dark;
    LocalStorageManager.setBool('isDarkTheme', isDarkTheme);
  }
}

final themeProvider = StateNotifierProvider<ThemeController, ThemeMode>(
  (ref) => ThemeController(),
);
