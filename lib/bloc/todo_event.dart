part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class ShowDataEvent extends TodoEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
// final List<TodoModel> todoList;
//
// const ShowDataEvent({required this.todoList});
//
// @override
// List<Object?> get props => [todoList];
//
// ShowDataEvent copyWith({List<TodoModel>? todoList}) {
//   return ShowDataEvent(todoList: todoList ?? this.todoList);
// }
}

class AddDataEvent extends TodoEvent {
  final String title;
  final String desc;
  final String date;

  const AddDataEvent({
    required this.title,
    required this.desc,
    required this.date,
  });

  @override
  List<Object> get props => [title, desc, date];

  AddDataEvent copyWith({
    String? title,
    String? desc,
    String? date,
  }) {
    return AddDataEvent(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      date: date ?? this.date,
    );
  }
}

class UpdateDataEvent extends TodoEvent {
  final TodoModel todoList;

  const UpdateDataEvent(this.todoList);

  @override
  List<Object?> get props => [todoList];
}

class DeleteDataEvent extends TodoEvent {
  final String id;

  const DeleteDataEvent({required this.id});

  DeleteDataEvent copyWith({String? id}) {
    return DeleteDataEvent(id: id ?? this.id);
  }

  @override
  List<Object> get props => [id];
}
