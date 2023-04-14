import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:i_todo_api/i_todo_api.dart';
import 'package:meta/meta.dart';
import 'package:todo_repository/todo_repository.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc({
    required TodoRepository todoRepository,
  })  : _todoRepository = todoRepository,
        super(TodoListState.initial()) {
    on<TodoListEventLoad>(_onLoadTodoList);
  }

  final TodoRepository _todoRepository;

  Future<void> _onLoadTodoList(
    TodoListEventLoad event,
    Emitter<TodoListState> emit,
  ) async {
    emit(state.copyWith(status: TodoListStatus.loading));
    try {
      emit(state.copyWith(
        status: TodoListStatus.loaded,
      ));

      await Future<void>.delayed(const Duration(milliseconds: 100));

      await emit.forEach(
        _todoRepository.getTodos(),
        onData: (todos) =>
            state.copyWith(todos: todos, status: TodoListStatus.loaded),
        onError: (error, stackTrace) =>
            state.copyWith(status: TodoListStatus.error),
      );
    } catch (e) {
      emit(state.copyWith(status: TodoListStatus.error));
    }
  }

  // Future<void> _onDeleteRequested(
  //   DeleteGroupRequested event,
  //   Emitter<GroupListState> emit,
  // ) async {
  //   emit(state.copyWith(status: TodoListStatus.loading));
  //   try {
  //     await _groupsRepository.deleteGroup(event.id);

  //     await emit.forEach(
  //       _groupsRepository.getGroups(),
  //       onData: (groups) => state.copyWith(
  //         groups: groups,
  //         status: TodoListStatus.deleted,
  //       ),
  //     );
  //   } catch (e) {
  //     emit(state.copyWith(status: TodoListStatus.error));
  //   }
  // }
}
