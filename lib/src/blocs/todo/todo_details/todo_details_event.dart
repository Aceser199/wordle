part of 'todo_details_bloc.dart';

abstract class TodoDetailsEvent extends Equatable {
  const TodoDetailsEvent();

  @override
  List<Object> get props => [];
}

class LoadTodoDetailsEvent extends TodoDetailsEvent {
  const LoadTodoDetailsEvent({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

class ChangeTitleTodoDetailsEvent extends TodoDetailsEvent {
  const ChangeTitleTodoDetailsEvent({required this.title});

  final String title;

  @override
  List<Object> get props => [title];
}

class ChangeDescriptionTodoDetailsEvent extends TodoDetailsEvent {
  const ChangeDescriptionTodoDetailsEvent({required this.description});

  final String description;

  @override
  List<Object> get props => [description];
}

class ChangeDueDateTodoDetailsEvent extends TodoDetailsEvent {
  const ChangeDueDateTodoDetailsEvent({required this.dueDate});

  final String dueDate;

  @override
  List<Object> get props => [dueDate];
}

class ChangeIsDoneTodoDetailsEvent extends TodoDetailsEvent {
  const ChangeIsDoneTodoDetailsEvent({required this.isDone});

  final bool isDone;

  @override
  List<Object> get props => [isDone];
}

class SaveTodoEvent extends TodoDetailsEvent {
  const SaveTodoEvent();

  @override
  List<Object> get props => [];
}
