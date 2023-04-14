import 'package:i_todo_api/i_todo_api.dart';

/// The interface for an API that provides access to a list of todos.
abstract class ITodoApi {
  const ITodoApi();

  /// Provides a [Stream] of all todos.
  Stream<List<Todo>> getTodos();

  /// Provides a [Stream] of a single Todo.
  /// If the Todo is not found, a [TodoNotFoundException] error is thrown.
  Stream<Todo> getTodo(String id);

  /// Creates a [Todo].
  Future<void> saveTodo(Todo todo);

  /// Deletes the `Todo` with the given id.
  ///
  /// If no `Todo` with the given id exists, a [TodoNotFoundException] error is
  /// thrown.
  Future<void> deleteTodo(String id);

  /// Fetches the latest list of todos from the API.
  /// This will replace the current list of todos on the [Stream].
  /// This is useful for when the list of todos has changed on the server.
  /// This will not update the list of todos if the list of todos has not
  /// changed on the server.
  Future<void> fetchTodos();
}

/// Error thrown when a [Todo] with a given id is not found.
class TodoNotFoundException implements Exception {}
