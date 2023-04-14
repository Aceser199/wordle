import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/todo/todo_details/todo_details_bloc.dart';
import '../../widgets/todos/todo_fields.dart';

class TodoDetailsScreen extends StatelessWidget {
  const TodoDetailsScreen({super.key});

  static const routeName = '/todo-details';

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo Details'),
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<TodoDetailsBloc, TodoDetailsState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status &&
                  current.status == TodoDetailsStatus.saved,
              listener: (context, state) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Todo saved'),
                  ),
                );
              },
            ),
            BlocListener<TodoDetailsBloc, TodoDetailsState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status &&
                  current.status == TodoDetailsStatus.error,
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Error saving todo'),
                  ),
                );
              },
            ),
          ],
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    titleField(context),
                    const SizedBox(height: 16),
                    descriptionField(context),
                    const SizedBox(height: 16),
                    dueDateField(context),
                    const SizedBox(height: 16),
                    completedField(context),
                    const SizedBox(height: 32),
                    submitButton(context, _formkey),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
