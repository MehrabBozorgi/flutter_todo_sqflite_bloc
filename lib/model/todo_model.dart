import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final String id;
  final String title;
  final String desc;
  final String date;

  const TodoModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.date,
  });

  TodoModel copyWith({
    String? id,
    String? title,
    String? desc,
    String? date,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [id, title, desc, date];
}
