import 'package:flutter/material.dart';

class KanbanPage extends StatelessWidget {
  const KanbanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kanban'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Kanban Page'),
      ),
    );
  }
}
