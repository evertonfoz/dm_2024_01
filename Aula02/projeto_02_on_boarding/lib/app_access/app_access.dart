import 'package:flutter/material.dart';

class AppAccessPage extends StatelessWidget {
  static const String routeName = '/app_access';

  const AppAccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: const Text(
          'Acesso ao App',
        ),
      ),
    );
  }
}
