part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<TodoModel> todoModel;

  const TodoState({required this.todoModel});

  @override
  List<Object?> get props => [todoModel];

  TodoState copyWith({required List<TodoModel> todoModel}) {
    return TodoState(todoModel: todoModel ?? this.todoModel);
  }
}
