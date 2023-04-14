import 'package:flutter/material.dart';
import 'package:flutter_temp/src/blocs/todo/todo_list/todo_list_bloc.dart';
import 'package:flutter_temp/src/widgets/todos/todo_card.dart';
import 'package:provider/provider.dart';

import 'add_todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<TodoListBloc>().state.todos.isEmpty
        ? const Center(
            child: Text('No todos yet'),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              final todo = context.watch<TodoListBloc>().state.todos[index];

              return TodoCard(todo: todo);
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: context.watch<TodoListBloc>().state.todos.length,
          );
  }
}
