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
          child: Text('Drawer Header'),
        ),
        ListTile(title: const Text('Home'), onTap: () => context.go('/')),
        ListTile(title: const Text('Calculator'), onTap: () => context.go('/calculator')),
        ListTile(title: const Text('Rating'), onTap: () => context.go('/result')),
        ListTile(title: const Text('History'), onTap: () => context.go('/history')),
        ListTile(title: const Text('Settings'), onTap: () {}),
      ],
    ));
  }
}
