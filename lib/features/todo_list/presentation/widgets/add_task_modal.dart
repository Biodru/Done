import 'package:done/config/theme/main_theme.dart';
import 'package:done/features/todo_list/data/models/task.dart';
import 'package:done/features/todo_list/presentation/cubit/task_list_cubit/task_list_cubit.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddTaskModal extends StatefulWidget {
  const AddTaskModal({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  final _controller = TextEditingController();
  Color _selectedColor = Colors.red;
  DateTime? _selectedDate;
  TaskPriority? _selectedPriority;
  List<DropdownMenuItem<int?>> items = [];
  int? _selectedContext;

  void dropdownCallback(int? newValue) {
    setState(() {
      _selectedContext = newValue;
    });
  }

  void dropdownPriorityCallback(TaskPriority? newValue) {
    setState(() {
      _selectedPriority = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<TaskListCubit>();
    final userContextCubit = context.watch<UserContextCubit>();
    _prepareView(userContextCubit);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              cursorColor: MainTheme.primary,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: MainTheme.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MainTheme.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MainTheme.primary),
                  ),
                  labelText: 'Nazwa',
                  labelStyle: TextStyle(color: MainTheme.secondary)),
            ),
          ),
          const Text('Wybierz profil'),
          DropdownButton<int?>(
            items: items,
            onChanged: dropdownCallback,
            dropdownColor: MainTheme.accent,
            iconDisabledColor: MainTheme.primary,
            hint: const Text('Profil: '),
            value: _selectedContext,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: MainTheme.accent,
                foregroundColor: MainTheme.primary),
            onPressed: () async {
              _selectedDate = await _selectDate();
            },
            child: const Text('Wybierz datę'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: MainTheme.accent,
                foregroundColor: MainTheme.primary),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Wybierz kolor'),
                  content: MaterialPicker(
                    pickerColor: Colors.red,
                    onColorChanged: (color) {
                      setState(() {
                        _selectedColor = color;
                      });
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Wybierz'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Wybierz kolor'),
          ),
          DropdownButton<TaskPriority?>(
            items: const [
              DropdownMenuItem(
                value: TaskPriority.high,
                child: Text('Wysoki'),
              ),
              DropdownMenuItem(
                value: TaskPriority.medium,
                child: Text('Średni'),
              ),
              DropdownMenuItem(
                value: TaskPriority.low,
                child: Text('Niski'),
              ),
              DropdownMenuItem(
                value: null,
                child: Text('Brak'),
              ),
            ],
            onChanged: dropdownPriorityCallback,
            dropdownColor: MainTheme.accent,
            iconDisabledColor: MainTheme.primary,
            hint: const Text('Priorytet: '),
            value: _selectedPriority,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: MainTheme.accent,
                foregroundColor: MainTheme.primary),
            onPressed: () {
              cubit.addNewTask(
                Task(
                    id: cubit.getMaxId(),
                    title: _controller.text,
                    chosenColor: _selectedColor,
                    userContextId: _selectedContext,
                    date: _selectedDate,
                    priority: _selectedPriority),
                context.watch<UserContextCubit>().state.currentContextId,
              );
            },
            child: const Text('Dodaj zadanie'),
          ),
        ],
      ),
    );
  }

  void _prepareView(UserContextCubit userContextCubit) {
    setState(() {
      _selectedContext = userContextCubit.state.currentContextId;
    });
    items.add(const DropdownMenuItem(
      value: null,
      child: Text('Wszystkie'),
    ));

    for (var context in userContextCubit.list) {
      items.add(DropdownMenuItem(
        value: context.id,
        child: Text(context.contextName),
      ));
    }
  }

  Future<DateTime?> _selectDate() => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
}
