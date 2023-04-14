import 'package:flutter/material.dart';

import '../../widgets/todos/todo_list.dart';

class MobileHomeBody extends StatelessWidget {
  const MobileHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const TodoList(),
    );
  }
}
