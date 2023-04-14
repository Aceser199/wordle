import 'dart:convert';

import 'package:rxdart/subjects.dart';
import 'package:i_todo_api/i_todo_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

// https://jsonplaceholder.typicode.com/todos

/// {@template local_storage_todos_api}
/// A Flutter implementation of the [TodosApi] that uses local storage.
/// {@endtemplate}
class LocalTodoApi extends ITodoApi {
  /// {@macro local_storage_todos_api}
  LocalTodoApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  final _todoStreamController = BehaviorSubject<List<Todo>>.seeded(const []);

  /// The key used for storing the todos locally.
  ///
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  // @visibleForTesting
  static const _kTodosCollectionKey = '__todos_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);

  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    // _plugin.remove(_kTodosCollectionKey);
    final todosJson = _getValue(_kTodosCollectionKey);
    if (todosJson != null) {
      // final mapList = json.decode(todosJson) as List<dynamic>;
      // print(mapList);
      // final todos = mapList.forEach((element) {
      //   print(json.decode(element));
      //   print(Todo.fromMap(Map<String, dynamic>.from(json.decode(element))));
      // });
      // final todos = mapList.map((dynamic e) => ).toList();
      // final todos = mapList
      //     .map((jsonM) => Todo.fromMap(Map<String, dynamic>.from(jsonM)))
      //     .toList();
      final todos = List<Map<String, dynamic>>.from(
        json.decode(todosJson) as List,
      )
          .map((jsonM) => Todo.fromJson(Map<String, dynamic>.from(jsonM)))
          .toList();
      _todoStreamController.add(todos);
    } else {
      _todoStreamController.add(const []);
    }
  }

  @override
  Stream<List<Todo>> getTodos() => _todoStreamController.asBroadcastStream();

  @override
  Stream<Todo> getTodo(String id) {
    return _todoStreamController.stream.map((List<Todo> todos) {
      final todo = todos.firstWhere((Todo t) => t.id == id,
          orElse: () => throw TodoNotFoundException());

      return todo;
    });
  }

  @override
  Future<void> saveTodo(Todo todo) {
    final todos = [..._todoStreamController.value];
    final todoIndex = todos.indexWhere((t) => t.id == todo.id);
    if (todoIndex >= 0) {
      todos[todoIndex] = todo;
    } else {
      todos.add(todo);
    }

    _todoStreamController.add(todos);
    return _setValue(_kTodosCollectionKey, json.encode(todos));
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todos = [..._todoStreamController.value];
    final todoIndex = todos.indexWhere((t) => t.id == id);
    if (todoIndex == -1) {
      throw TodoNotFoundException();
    } else {
      todos.removeAt(todoIndex);
      _todoStreamController.add(todos);
      return _setValue(_kTodosCollectionKey, json.encode(todos));
    }
  }

  @override
  Future<void> fetchTodos() async {
    // _plugin.remove(_kTodosCollectionKey);

    await Future<void>.delayed(const Duration(milliseconds: 100));
    _init();
  }
}
