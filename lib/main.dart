import 'package:flutter/material.dart';
import 'package:local_todo_api/local_todo_api.dart';

import 'src/bootstrap.dart';
import 'src/screens/settings/settings_controller.dart';
import 'src/screens/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  final todosApi = LocalTodoApi(
    plugin: await SharedPreferences.getInstance(),
  );

  // final schoolsApi = SchoolService();

  bootstrap(
    todosApi: todosApi,
    settingsController: settingsController,
  );
}
