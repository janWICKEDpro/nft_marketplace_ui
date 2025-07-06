import 'package:flutter/material.dart';

class TablesPage extends StatelessWidget {
  const TablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tables'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(child: Text('Tables Page')),
    );
  }
}
