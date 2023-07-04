import 'package:bmi_calculator/services/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/settings.dart';
import '../drawer.dart';

class BmiSettings extends StatelessWidget {
  const BmiSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: const Text('Settings'),
      ),
      drawer: const NavDrawer(),
      body: FutureBuilder<Settings>(
        future: SettingsService.getSettings(),
        builder: (BuildContext context, AsyncSnapshot<Settings> settings) {
          return ListView(
            children: <Widget>[
              ListTile(
                onTap: () {
                  context.go('/settings/users');
                },
                title: const Text(
                  'Manage Users',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: Text(
                  settings.data?.name ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                leading: const Icon(Icons.people, color: Colors.deepPurple),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
              const Divider(height: 0), // Set height to 0 to remove padding
              ListTile(
                onTap: () {},
                title: const Text(
                  'Units',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                subtitle: const Text(
                  'Metric',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                leading: const Icon(Icons.settings, color: Colors.deepPurple),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              ),
            ],
          );
        },
      ),
    );
  }
}
