import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import '../database/db_provider.dart';

class CreateForm extends StatefulWidget {
  const CreateForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateFormState createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
              onSaved: (value) {
                _name = value ?? "";
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  // Call the createCategory method from the DbProvider class
                  DbProvider.dbProvider.createCategory(_name);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Category created'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  ));
                }
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
