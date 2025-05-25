import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/providers/theme_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:upgrader/upgrader.dart';

import 'main_scaffold.dart';
import 'screens/screen1.dart';
import 'screens/screen2.dart';
import 'screens/screen3.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/screen1',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainScaffold(child: child),
      routes: [
        GoRoute(
          path: '/screen1',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: Screen1()),
        ),
        GoRoute(
          path: '/screen2',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: Screen2()),
        ),
        GoRoute(
          path: '/screen3',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: Screen3()),
        ),
      ],
    ),
  ],
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return UpgradeAlert(
      child: MaterialApp.router(
        title: 'Flutter Starter',
        themeMode: themeMode,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.light,
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          ),
        ),
        routerConfig: _router,
      ),
    );
  }
}
