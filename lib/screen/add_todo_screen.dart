import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/todo_bloc.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

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
                context.read<TodoBloc>().add(
                      AddDataEvent(
                        title: _titleController.text,
                        desc: _descController.text,
                        date: _dateController.text,
                      ),
                    );
                print('Yes');
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
