part of 'todo_list_bloc.dart';

enum TodoListStatus { initial, loading, loaded, error }

class TodoListState extends Equatable {
  final List<Todo> todos;
  final TodoListStatus status;
  const TodoListState({
    required this.todos,
    required this.status,
  });

  factory TodoListState.initial() {
    return const TodoListState(
      todos: [],
      status: TodoListStatus.initial,
    );
  }

  @override
  List<Object> get props => [todos, status];

  TodoListState copyWith({
    List<Todo>? todos,
    TodoListStatus? status,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
    );
  }
}
