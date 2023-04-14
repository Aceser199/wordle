import 'package:flutter/material.dart';
import 'package:flutter_temp/src/screens/todo/todo_details_screen.dart';

import '../../widgets/todos/todo_list.dart';

class DesktopHomeBody extends StatelessWidget {
  const DesktopHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, TodoDetailsScreen.routeName,
              arguments: '');
        },
        label: const Text('Add Todo'),
        icon: const Icon(Icons.add),
      ),
      body: const TodoList(),
    );
  }
}
