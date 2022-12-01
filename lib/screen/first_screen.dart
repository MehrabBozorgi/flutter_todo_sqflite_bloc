import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sql_bloc/screen/add_todo_screen.dart';
import 'package:flutter_sql_bloc/screen/edit_todo_screen.dart';

import '../bloc/todo_bloc.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    context.read<TodoBloc>().add(ShowDataEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddTodoScreen()));
        },
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        // bloc:,

        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todoModel.length,
            itemBuilder: (context, index) {
              final helper = state.todoModel[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        helper.title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        helper.desc,
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        helper.date,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              context
                                  .read<TodoBloc>()
                                  .add(DeleteDataEvent(id: helper.id));
                            },
                            icon: const Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => EditTodoScreen(
                                    id: helper.id,
                                    title: helper.title,
                                    desc: helper.desc,
                                    date: helper.date,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
