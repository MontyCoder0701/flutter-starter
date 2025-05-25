import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleController extends StateNotifier<Locale> {
  LocaleController() : super(Locale('en'));

  bool get isLocaleEnglish => state == Locale('en');

  void toggleLocale() {
    state = isLocaleEnglish ? Locale('ko') : Locale('en');
  }
}

final localeProvider = StateNotifierProvider<LocaleController, Locale>(
  (ref) => LocaleController(),
);
