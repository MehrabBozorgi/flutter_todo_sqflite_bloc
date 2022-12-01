import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';
import '../model/todo_model.dart';

class EditTodoScreen extends StatefulWidget {
  const EditTodoScreen({
    Key? key,
    required this.id,
    required this.title,
    required this.desc,
    required this.date,
  }) : super(key: key);
  final String id;
  final String title;
  final String desc;
  final String date;

  @override
  State<EditTodoScreen> createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.title;
    _descController.text = widget.desc;
    _dateController.text = widget.date;
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration:
                    const InputDecoration(filled: true, labelText: 'title'),
                controller: _titleController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration:
                    const InputDecoration(filled: true, labelText: 'desc'),
                controller: _descController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration:
                    const InputDecoration(filled: true, labelText: 'date'),
                controller: _dateController,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final todoList = TodoModel(
                  id: widget.id,
                  title: _titleController.text,
                  desc: _descController.text,
                  date: _dateController.text,
                );
                context.read<TodoBloc>().add(UpdateDataEvent(todoList));
                Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
