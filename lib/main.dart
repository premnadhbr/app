import 'package:bloc_mini_project_hive/controller/details/bloc/details_bloc.dart';
import 'package:bloc_mini_project_hive/controller/studentLIst/bloc/students_bloc.dart';
import 'package:bloc_mini_project_hive/view/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => StudentsBloc(),
      ),
      BlocProvider(
        create: (context) => DetailsBloc(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginForm(),
    );
  }
}
