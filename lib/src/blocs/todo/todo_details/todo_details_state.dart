part of 'todo_details_bloc.dart';

enum TodoDetailsStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class TodoDetailsState extends Equatable {
  final String id;
  final String title;
  final String description;
  final String dueDate;
  final bool isDone;
  final TodoDetailsStatus status;

  const TodoDetailsState({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.isDone,
    required this.status,
  });

  factory TodoDetailsState.initial() {
    return TodoDetailsState(
      id: '',
      title: '',
      description: '',
      dueDate: DateFormat('yyyy-MM-dd')
          .format(DateTime.now().add(const Duration(days: 2))),
      isDone: false,
      status: TodoDetailsStatus.initial,
    );
  }

  Todo get todo {
    return Todo(
      id: id.isEmpty ? null : id,
      title: title,
      description: description,
      dueDate: dueDate,
      isDone: isDone,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      title,
      description,
      dueDate,
      isDone,
      status,
    ];
  }

  TodoDetailsState copyWith({
    String? id,
    String? title,
    String? description,
    String? dueDate,
    bool? isDone,
    TodoDetailsStatus? status,
  }) {
    return TodoDetailsState(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
      status: status ?? this.status,
    );
  }
}
