import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../local_storage_manager.dart';

class ThemeController extends Notifier<ThemeMode> {
  bool get isDarkTheme => state == ThemeMode.dark;

  @override
  ThemeMode build() {
    final isPreviouslyDarkTheme = LocalStorageManager.getBool('isDarkTheme');
    if (isPreviouslyDarkTheme != null) {
      return isPreviouslyDarkTheme ? ThemeMode.dark : ThemeMode.light;
    }
    return ThemeMode.system;
  }

  void toggleTheme() {
    state = isDarkTheme ? ThemeMode.light : ThemeMode.dark;
    LocalStorageManager.setBool('isDarkTheme', isDarkTheme);
  }
}

final themeProvider = NotifierProvider<ThemeController, ThemeMode>(
  ThemeController.new,
);
