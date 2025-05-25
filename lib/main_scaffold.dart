import 'package:flutter/material.dart';
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
    final String location = GoRouterState.of(context).uri.toString();
    final int selectedIndex = _locationToTabIndex(location);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'Drawer',
                style: TextStyle(color: Colors.white, fontSize: 24),
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
          ],
        ),
      ),
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
