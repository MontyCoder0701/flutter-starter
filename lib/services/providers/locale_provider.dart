import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocaleController extends Notifier<Locale> {
  @override
  Locale build() => const Locale('en');

  bool get isLocaleEnglish => state == const Locale('en');

  void toggleLocale() {
    state = isLocaleEnglish ? const Locale('ko') : const Locale('en');
  }
}

final localeProvider = NotifierProvider<LocaleController, Locale>(
  LocaleController.new,
);
