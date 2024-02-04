import 'package:done/config/theme/main_theme.dart';
import 'package:done/features/notes/data/models/note.dart';
import 'package:done/features/notes/presentation/cubit/notes_list_cubit.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class EditNotePage extends StatefulWidget {
  const EditNotePage({super.key, required this.note});

  final Note? note;

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<DropdownMenuItem<int?>> _items = [];

  Color? _selectedColor;

  int? _selectedContext;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final userContextCubit = context.read<UserContextCubit>();
      _prepareView(userContextCubit);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userContextCubit = context.watch<UserContextCubit>();
    final cubit = context.watch<NotesListCubit>();

    //_prepareView(userContextCubit);

    return Scaffold(
      backgroundColor: widget.note?.chosenColor ?? MainTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 32),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: widget.note?.userContextId != null
                        ? userContextCubit
                            .findContext(widget.note!.userContextId!)!
                            .contextColor
                        : MainTheme.secondary,
                  ),
                ),
                const Spacer(),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  //MARK: Title Editor
                  TextField(
                    controller: _titleController,
                    style: const TextStyle(color: Colors.black, fontSize: 32),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.note?.topic ?? 'Tutaj wpisz tytuł'),
                  ),
                  //MARK: Description Editor
                  TextField(
                    controller: _descriptionController,
                    style: const TextStyle(color: Colors.black, fontSize: 24),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText:
                            widget.note?.description ?? 'Tutaj wpisz opis'),
                  ),
                  //MARK: ColorPicker
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
                  //MARK:  ContextPicker
                  const Text('Wybierz profil'),
                  DropdownButton<int?>(
                    items: _items,
                    onChanged: _dropdownCallback,
                    dropdownColor: MainTheme.accent,
                    iconDisabledColor: MainTheme.primary,
                    hint: const Text('Profil: '),
                    value: _selectedContext,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.note == null) {
            final newNote = Note(
              id: cubit.getMaxId(),
              topic: _titleController.text,
              description: _descriptionController.text,
              chosenColor: _selectedColor,
              userContextId: _selectedContext,
              createdTime: DateTime.now(),
              lastEdited: DateTime.now(),
            );
            cubit.addOrEditNote(
                newNote, userContextCubit.state.currentContextId);
          } else {
            Map<Object, Object?> dataToEdit = {};
            if (_titleController.text != widget.note?.topic &&
                _titleController.text.isNotEmpty) {
              dataToEdit['topic'] = _titleController.text;
            }

            if (_descriptionController.text != widget.note?.description &&
                _descriptionController.text.isNotEmpty) {
              dataToEdit['description'] = _descriptionController.text;
            }

            if (_selectedColor != widget.note?.chosenColor) {
              dataToEdit['chosenColor'] =
                  '#${_selectedColor?.value.toRadixString(16)}';
            }

            if (_selectedContext != widget.note?.userContextId) {
              dataToEdit['userContextId'] = _selectedContext;
            }

            if (dataToEdit.isNotEmpty) {
              cubit.editNote(userContextCubit.state.currentContextId,
                  dataToEdit, widget.note?.id.toString() ?? '');
            }
          }
          Navigator.pop(context);
        },
        elevation: 5,
        backgroundColor: widget.note?.userContextId != null
            ? userContextCubit
                .findContext(widget.note!.userContextId!)!
                .contextColor
            : MainTheme.secondary,
        child: Icon(
          Icons.save_sharp,
          color: widget.note?.chosenColor ?? MainTheme.primary,
        ),
      ),
    );
  }

  void _dropdownCallback(int? newValue) {
    setState(() {
      _selectedContext = newValue;
    });
  }

  void _prepareView(UserContextCubit userContextCubit) {
    setState(() {
      _selectedContext = userContextCubit.state.currentContextId;
      if (widget.note != null) {
        _selectedColor = widget.note?.chosenColor;
      }
    });
    _items.add(const DropdownMenuItem(
      value: null,
      child: Text('Wszystkie'),
    ));

    for (var context in userContextCubit.list) {
      _items.add(DropdownMenuItem(
        value: context.id,
        child: Text(context.contextName),
      ));
    }
  }
}
