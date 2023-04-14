import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_repository/todo_repository.dart';

import '../blocs/todo/todo_list/todo_list_bloc.dart';
import '../routes.dart';
import '../screens/settings/settings_controller.dart';
import '../theme/theme.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.todosRepository,
    required this.settingsController,
  });

  final TodoRepository todosRepository;
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TodoRepository>(
          create: (context) => todosRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TodoListBloc>(
            create: (context) => TodoListBloc(
              todoRepository: context.read<TodoRepository>(),
            )..add(TodoListEventLoad()),
          ),
        ],
        child: AppView(
          settingsController: settingsController,
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key, required this.settingsController});
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Todo App Bloc',
          debugShowCheckedModeBanner: false,
          theme: DmhTheme.light,
          darkTheme: DmhTheme.dark,
          themeMode: settingsController.themeMode,
          // localizationsDelegates: AppLocalizations.localizationsDelegates,
          // supportedLocales: AppLocalizations.supportedLocales,
          onGenerateRoute: (RouteSettings routeSettings) =>
              routes(routeSettings, settingsController),
        );
      },
    );
  }
}
