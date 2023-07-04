import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => context.go('/'),
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Calculator'),
            onTap: () => context.go('/calculator'),
          ),
          ListTile(
            leading: const Icon(Icons.star_rate),
            title: const Text('Rating'),
            onTap: () => context.go('/result'),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () => context.go('/history'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => context.go('/settings'),
          ),
        ],
      ),
    );
  }
}
