import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:done/config/theme/main_theme.dart';
import 'package:done/features/user_context/data/models/user_context.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';

class UserContextDrawer extends StatelessWidget {
  const UserContextDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<UserContextCubit>();
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Wybór profilu',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            ContextTile(
              userContext: null,
              onTap: () {
                cubit.changeContext(null);
              },
              selectedContext: cubit.state.currentContextId == null,
            ),
            cubit.state.isLoading
                ? CircularProgressIndicator(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  )
                : Column(
                    children: cubit.state.contextList
                        .map(
                          (e) => ContextTile(
                            userContext: e,
                            onTap: () {
                              cubit.changeContext(e.id);
                            },
                            selectedContext:
                                e.id == cubit.state.currentContextId,
                          ),
                        )
                        .toList(),
                  ),
            const Spacer(),
            Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  backgroundColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  onPressed: () {
                    showModalBottomSheet<void>(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        builder: (BuildContext context) {
                          return AddUserContextModal(
                            cubit: cubit,
                          );
                        });
                  },
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddUserContextModal extends StatefulWidget {
  final UserContextCubit cubit;
  const AddUserContextModal({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  @override
  State<AddUserContextModal> createState() => _AddUserContextModalState();
}

class _AddUserContextModalState extends State<AddUserContextModal> {
  final _controller = TextEditingController();
  Color selectedColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              cursorColor: Theme.of(context).colorScheme.primary,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  labelText: 'Nazwa',
                  labelStyle: const TextStyle(color: MainTheme.secondary)),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: MainTheme.accent,
                foregroundColor: Theme.of(context).colorScheme.primary),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Wybierz kolor'),
                  content: MaterialPicker(
                    pickerColor: Colors.red,
                    onColorChanged: (color) {
                      setState(() {
                        selectedColor = color;
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: MainTheme.accent,
                foregroundColor: Theme.of(context).colorScheme.primary),
            onPressed: () {
              widget.cubit.addNewContext(
                UserContext(
                    id: widget.cubit.getMaxId(),
                    contextName: _controller.text,
                    contextColor: selectedColor),
              );
            },
            child: const Text('Dodaj profil'),
          ),
        ],
      ),
    );
  }
}

class ContextTile extends StatelessWidget {
  final UserContext? userContext;
  final Function()? onTap;
  final bool selectedContext;
  const ContextTile({
    Key? key,
    required this.userContext,
    required this.onTap,
    required this.selectedContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Container(
          decoration: selectedContext
              ? BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  borderRadius: BorderRadius.circular(4),
                )
              : null,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: userContext?.contextColor,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  userContext?.contextName ?? 'Wszystkie',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
