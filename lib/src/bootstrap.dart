import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:i_todo_api/i_todo_api.dart';
import 'package:todo_repository/todo_repository.dart';

import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'screens/settings/settings_controller.dart';

void bootstrap({
  required ITodoApi todosApi,
  required SettingsController settingsController,
}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final todosRepository = TodoRepository(todosApi: todosApi);

  runZonedGuarded(
    () => runApp(
      App(
        todosRepository: todosRepository,
        settingsController: settingsController,
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
