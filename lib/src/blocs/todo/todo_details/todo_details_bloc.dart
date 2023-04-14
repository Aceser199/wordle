import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i_todo_api/i_todo_api.dart';
import 'package:intl/intl.dart';
import 'package:todo_repository/todo_repository.dart';

part 'todo_details_event.dart';
part 'todo_details_state.dart';

class TodoDetailsBloc extends Bloc<TodoDetailsEvent, TodoDetailsState> {
  TodoDetailsBloc({
    required TodoRepository todoRepository,
  })  : _todoRepository = todoRepository,
        super(TodoDetailsState.initial()) {
    on<LoadTodoDetailsEvent>(_onLoadTodoDetailsEvent);
    on<ChangeTitleTodoDetailsEvent>(_onChangeTitleTodoDetailsEvent);
    on<ChangeDescriptionTodoDetailsEvent>(
      _onChangeDescriptionTodoDetailsEvent,
    );
    on<ChangeDueDateTodoDetailsEvent>(_onChangeDueDateTodoDetailsEvent);
    on<ChangeIsDoneTodoDetailsEvent>(_onChangeIsDoneTodoDetailsEvent);
    on<SaveTodoEvent>(_onSaveTodoEvent);
  }

  final TodoRepository _todoRepository;

  Future<void> _onLoadTodoDetailsEvent(
    LoadTodoDetailsEvent event,
    Emitter<TodoDetailsState> emit,
  ) async {
    if (event.id.isEmpty) {
      emit(state.copyWith(status: TodoDetailsStatus.loaded));
      return;
    }

    emit(state.copyWith(status: TodoDetailsStatus.loading));

    await Future<void>.delayed(const Duration(milliseconds: 200));

    try {
      await emit.forEach(
        _todoRepository.getTodo(event.id),
        onData: (todo) => state.copyWith(
          id: todo.id,
          title: todo.title,
          description: todo.description,
          dueDate: todo.dueDate,
          isDone: todo.isDone,
          status: TodoDetailsStatus.loaded,
        ),
        onError: (error, stackTrace) => state.copyWith(
          status: TodoDetailsStatus.error,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: TodoDetailsStatus.error));
    }
  }

  void _onChangeTitleTodoDetailsEvent(
    ChangeTitleTodoDetailsEvent event,
    Emitter<TodoDetailsState> emit,
  ) async {
    emit(state.copyWith(title: event.title));
  }

  void _onChangeDescriptionTodoDetailsEvent(
    ChangeDescriptionTodoDetailsEvent event,
    Emitter<TodoDetailsState> emit,
  ) async {
    emit(state.copyWith(description: event.description));
  }

  void _onChangeDueDateTodoDetailsEvent(
    ChangeDueDateTodoDetailsEvent event,
    Emitter<TodoDetailsState> emit,
  ) async {
    emit(state.copyWith(
      dueDate: event.dueDate,
    ));
  }

  void _onChangeIsDoneTodoDetailsEvent(
    ChangeIsDoneTodoDetailsEvent event,
    Emitter<TodoDetailsState> emit,
  ) async {
    emit(state.copyWith(isDone: event.isDone));
  }

  void _onSaveTodoEvent(
    SaveTodoEvent event,
    Emitter<TodoDetailsState> emit,
  ) async {
    print(state.id);
    try {
      emit(state.copyWith(
        status: TodoDetailsStatus.loading,
      ));

      await Future.delayed(const Duration(milliseconds: 100));

      await _todoRepository.saveTodo(state.todo);

      emit(state.copyWith(
        status: TodoDetailsStatus.saved,
      ));
    } catch (e) {
      print(e);
      emit(state.copyWith(
        status: TodoDetailsStatus.error,
      ));
    }
  }
}
