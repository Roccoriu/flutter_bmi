import 'package:flutter/material.dart';

class AddUserDialog extends StatefulWidget {
  final Function(String name) onUserAdd;
  const AddUserDialog({super.key, required this.onUserAdd});

  @override
  createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add User'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User name',
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Add'),
          onPressed: () {
            widget.onUserAdd(_controller.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
