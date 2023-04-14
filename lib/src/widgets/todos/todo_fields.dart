import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../blocs/todo/todo_details/todo_details_bloc.dart';
import '../../mixins/validation_mixin.dart';
import '../shared/loading_container_field.dart';

Widget titleField(BuildContext context) {
  return BlocBuilder<TodoDetailsBloc, TodoDetailsState>(
    // buildWhen: (previous, current) => previous.title != current.title,
    builder: (context, state) {
      if (state.status == TodoDetailsStatus.loading) {
        return const LoadingContainerField();
      }
      return TextFormField(
        initialValue: state.title,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        maxLength: 255,
        decoration: const InputDecoration(
          icon: Icon(Icons.title),
          labelText: 'Title',
        ),
        onChanged: (value) {
          context.read<TodoDetailsBloc>().add(
                ChangeTitleTodoDetailsEvent(title: value),
              );
        },
        validator: (value) {
          ValidationMixin validationMixin = ValidationMixin();

          return validationMixin.validateRequiredField(value, 'title');
        },
      );
    },
  );
}

Widget descriptionField(BuildContext context) {
  return BlocBuilder<TodoDetailsBloc, TodoDetailsState>(
    // buildWhen: (previous, current) =>
    //     previous.description != current.description,
    builder: (context, state) {
      if (state.status == TodoDetailsStatus.loading) {
        return const LoadingContainerField();
      }
      return TextFormField(
        initialValue: state.description,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        maxLength: 1000,
        decoration: const InputDecoration(
          icon: Icon(Icons.description),
          labelText: 'Description',
        ),
        onChanged: (value) {
          context.read<TodoDetailsBloc>().add(
                ChangeDescriptionTodoDetailsEvent(description: value),
              );
        },
        // validator: (value) {
        //   ValidationMixin validationMixin = ValidationMixin();

        //   return validationMixin.validateRequiredField(value, 'title');
        // },
      );
    },
  );
}

Widget dueDateField(context) {
  return BlocBuilder<TodoDetailsBloc, TodoDetailsState>(
    // buildWhen: (previous, current) => previous.dueDate != current.dueDate,
    builder: (context, state) {
      if (state.status == TodoDetailsStatus.loading) {
        return const LoadingContainerField();
      }

      return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.date_range),
        title: Text(state.dueDate),
        subtitle: const Text('Due Date'),
        trailing: const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(Icons.edit),
        ),
        onTap: () async {
          await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
          ).then((value) {
            if (value != null) {
              context.read<TodoDetailsBloc>().add(
                    ChangeDueDateTodoDetailsEvent(
                      dueDate: DateFormat('yyyy-MM-dd').format(value),
                    ),
                  );
            }
          });
        },
      );
    },
  );
}

Widget completedField(BuildContext context) {
  return BlocBuilder<TodoDetailsBloc, TodoDetailsState>(
    // buildWhen: (previous, current) => previous.isDone != current.isDone,
    builder: (context, state) {
      if (state.status == TodoDetailsStatus.loading) {
        return const LoadingContainerField();
      }

      return SwitchListTile.adaptive(
        value: state.isDone,
        onChanged: (value) {
          context.read<TodoDetailsBloc>().add(
                ChangeIsDoneTodoDetailsEvent(isDone: value),
              );
        },
        title: const Text('Completed'),
        activeColor: Colors.green,
        inactiveThumbColor: Colors.red,
        inactiveTrackColor: Colors.red[100],
      );
    },
  );
}

Widget submitButton(BuildContext context, GlobalKey<FormState> formKey) {
  return BlocBuilder<TodoDetailsBloc, TodoDetailsState>(
    builder: (context, state) {
      if (state.status == TodoDetailsStatus.loading) {
        return const LoadingContainerField();
      }

      return SizedBox(
        width: 250,
        child: ElevatedButton.icon(
          onPressed: () {
            if (!formKey.currentState!.validate()) {
              return;
            }

            context.read<TodoDetailsBloc>().add(
                  const SaveTodoEvent(),
                );
          },
          icon: const Icon(
            Icons.save,
            size: 18,
          ),
          label: const Text('SUBMIT TODO'),
        ),
      );
    },
  );
}
