import 'package:flutter/material.dart';
import 'package:flutter_starter/main_drawer.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  static const tabs = ['/screen1', '/screen2', '/screen3'];

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) => location.startsWith(t));
    return index >= 0 ? index : 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final selectedIndex = _locationToTabIndex(location);

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text('Flutter Starter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => context.go(tabs[index]),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Screen 1'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Screen 2'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Screen 3'),
        ],
      ),
    );
  }
}
