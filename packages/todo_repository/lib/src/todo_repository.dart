import 'package:i_todo_api/i_todo_api.dart';

/// {@template todos_repository}
/// A repository that handles `todo` related requests.
/// {@endtemplate}
class TodoRepository {
  /// {@macro todos_repository}
  const TodoRepository({
    required ITodoApi todosApi,
  }) : _todosApi = todosApi;

  final ITodoApi _todosApi;

  /// Provides a [Stream] of all todos.
  Stream<List<Todo>> getTodos() => _todosApi.getTodos();

  /// Provides a [Stream] of a single todo.
  /// If the todo is not found, a [TodoNotFoundException] error is thrown.
  Stream<Todo> getTodo(String id) => _todosApi.getTodo(id);

  /// Saves a [Todo].
  ///
  /// If a [Todo] with the same id already exists, it will be replaced.
  Future<void> saveTodo(Todo todo) => _todosApi.saveTodo(todo);

  /// Deletes the `todo` with the given id.
  ///
  /// If no `todo` with the given id exists, a [TodoNotFoundException] error is
  /// thrown.
  Future<void> deleteTodo(String id) => _todosApi.deleteTodo(id);

  Future<void> fetchTodos() => _todosApi.fetchTodos();
}
