import 'package:bmi_calculator/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../components/user_create_dialog.dart';
import '../../services/user_service.dart';

class BmiUserSettings extends StatefulWidget {
  const BmiUserSettings({super.key});

  @override
  createState() => _BmiUserSettingsState();
}

class _BmiUserSettingsState extends State<BmiUserSettings> {
  Future<List<User>>? userFuture;
  int? selectedUserId;

  @override
  void initState() {
    super.initState();
    userFuture = UserService.getAllUsers();
    fetchCurrentUserId();
  }

  void fetchCurrentUserId() async {
    int userId = await UserService.getCurrentUserId();
    setState(() {
      selectedUserId = userId;
    });
  }

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        title: Text(l10n.appBarTitleUserSettings),
      ),
      //drawer: const NavDrawer(),
      body: FutureBuilder<List<User>>(
        future: userFuture,
        builder: (BuildContext context, AsyncSnapshot<List<User>> users) {
          return ListView.separated(
            itemCount: users.data?.length ?? 0,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 0),
            itemBuilder: (BuildContext context, int index) {
              String initials = users.data![index].name
                  .split(' ')
                  .map((name) => name[0])
                  .take(2)
                  .join();
              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                leading: CircleAvatar(
                  backgroundColor: users.data![index].id == selectedUserId
                      ? Colors.deepPurple
                      : Colors.grey,
                  child: Text(
                    initials,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  users.data![index].name,
                  style: TextStyle(
                    color: users.data![index].id == selectedUserId
                        ? Colors.deepPurple
                        : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () async {
                  await UserService.setCurrentUser(id: users.data![index].id);
                  setState(() {
                    selectedUserId = users.data![index].id;
                  });
                },
                tileColor: users.data![index].id == selectedUserId
                    ? Colors.deepPurple.withOpacity(0.1)
                    : null,
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _showAddUserDialog,
        child: Icon(Icons.person_add, semanticLabel: l10n.addUser),
      ),
    );
  }

  Future<void> _showAddUserDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AddUserDialog(
          onUserAdd: (userName) {
            UserService.createUser(name: userName).then((_) {
              setState(() {
                userFuture = UserService.getAllUsers();
              });
            });
          },
        );
      },
    );
  }
}
