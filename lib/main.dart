import 'package:done/core/presentation/theme/color_schemes.g.dart';
import 'package:done/features/bottom_bar/presentation/cubit/cubit/bottom_bar_cubit.dart';
import 'package:done/features/bottom_bar/presentation/home_page.dart';
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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<UserContextCubit>(
            create: (context) => UserContextCubit(),
          ),
          BlocProvider<BottomBarCubit>(
            create: (context) => BottomBarCubit(),
          ),
        ],
        child: BlocBuilder<UserContextCubit, UserContextState>(
          buildWhen: (previous, current) =>
              previous.currentContextId != current.currentContextId,
          builder: (context, state) {
            return const HomePage();
          },
        ),
      ),
    );
  }
}
