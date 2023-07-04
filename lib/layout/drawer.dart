import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Text(
              l10n.appBarTitleMenu,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(l10n.appBarTitleHome),
            onTap: () => context.go('/'),
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: Text(l10n.appBarTitleCalculator),
            onTap: () => context.go('/calculator'),
          ),
          ListTile(
            leading: const Icon(Icons.star_rate),
            title: Text(l10n.appBarTitleRating),
            onTap: () => context.go('/result'),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: Text(l10n.appBarTitleHistory),
            onTap: () => context.go('/history'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(l10n.appBarTitleSettings),
            onTap: () => context.go('/settings'),
          ),
        ],
      ),
    );
  }
}
