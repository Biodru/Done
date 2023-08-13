import 'package:done/features/todo_list/presentation/pages/todo_list_page.dart';
import 'package:done/features/user_context/presentation/cubit/cubit/user_context_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<UserContextCubit>(
        create: (context) => UserContextCubit(),
        child: BlocBuilder<UserContextCubit, UserContextState>(
          buildWhen: (previous, current) =>
              previous.currentContextId != current.currentContextId,
          builder: (context, state) {
            return const TodoListPage();
          },
        ),
      ),
    );
  }
}
