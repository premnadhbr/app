import 'package:bloc_mini_project_hive/controller/details/bloc/details_bloc.dart';
import 'package:bloc_mini_project_hive/controller/studentLIst/bloc/students_bloc.dart';
import 'package:bloc_mini_project_hive/controller/switch/bloc/switch_bloc.dart';
import 'package:bloc_mini_project_hive/utils/constants/app_theme.dart';
import 'package:bloc_mini_project_hive/utils/services/notifications.dart';
import 'package:bloc_mini_project_hive/view/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'controller/switch/bloc/switch_state.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBloc.storage = await storage;
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
      ),
      BlocProvider(
        create: (context) => SwitchBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchBloc, SwitchState>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.switchValue ? darkTheme : lightTheme,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: LoginForm(),
        );
      },
    );
  }
}
