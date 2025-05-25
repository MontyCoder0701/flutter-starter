import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'l10n/app_localizations.dart';
import 'services/providers/locale_provider.dart';
import 'services/providers/theme_provider.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkTheme = themeNotifier.isDarkTheme;

    final localeNotifier = ref.read(localeProvider.notifier);
    final isLocaleEnglish = localeNotifier.isLocaleEnglish;
    final localize = AppLocalizations.of(context)!;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Drawer',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Screen 1'),
            onTap: () {
              Navigator.pop(context);
              context.go('/screen1');
            },
          ),
          ListTile(
            leading: const Icon(Icons.explore),
            title: const Text('Screen 2'),
            onTap: () {
              Navigator.pop(context);
              context.go('/screen2');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Screen 3'),
            onTap: () {
              Navigator.pop(context);
              context.go('/screen3');
            },
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Theme'),
            secondary: const Icon(Icons.dark_mode),
            value: isDarkTheme,
            onChanged: (value) {
              themeNotifier.toggleTheme();
            },
          ),
          SwitchListTile(
            title: Text(localize.translate),
            secondary: const Icon(Icons.language),
            value: isLocaleEnglish,
            onChanged: (value) {
              localeNotifier.toggleLocale();
            },
          ),
        ],
      ),
    );
  }
}
