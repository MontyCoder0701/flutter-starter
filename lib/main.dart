import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:upgrader/upgrader.dart';

import 'go_router.dart';
import 'l10n/app_localizations.dart';
import 'services/local_storage_manager.dart';
import 'services/providers/locale_provider.dart';
import 'services/providers/theme_provider.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageManager.initialize();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final themeMode = ref.watch(themeProvider);

    return UpgradeAlert(
      child: MaterialApp.router(
        title: 'Flutter Starter',
        locale: locale,
        themeMode: themeMode,
        theme: CustomTheme.light,
        darkTheme: CustomTheme.dark,
        routerConfig: goRouter,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
