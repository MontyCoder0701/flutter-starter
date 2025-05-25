import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/go_router.dart';
import 'package:flutter_starter/providers/theme_provider.dart';
import 'package:flutter_starter/theme.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return UpgradeAlert(
      child: MaterialApp.router(
        title: 'Flutter Starter',
        themeMode: themeMode,
        theme: CustomTheme.light,
        darkTheme: CustomTheme.dark,
        routerConfig: goRouter,
      ),
    );
  }
}
