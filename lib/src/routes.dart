import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_repository/todo_repository.dart';

import 'blocs/todo/todo_details/todo_details_bloc.dart';
import 'screens/todo/home_screen.dart';
import 'screens/settings/settings_controller.dart';
import 'screens/settings/settings_view.dart';
import 'screens/todo/todo_details_screen.dart';

Route? routes(RouteSettings settings, SettingsController settingsController) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      );

    case TodoDetailsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          final String id = settings.arguments as String;

          return BlocProvider<TodoDetailsBloc>(
            create: (context) => TodoDetailsBloc(
              todoRepository: context.read<TodoRepository>(),
            )..add(LoadTodoDetailsEvent(id: id)),
            child: const TodoDetailsScreen(),
          );
        },
      );

    case SettingsView.routeName:
      return MaterialPageRoute(
        builder: (context) {
          return SettingsView(controller: settingsController);
        },
      );
    default:
      return null;
  }
}
