import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queries_firebase/bloc/queries_bloc.dart';
import 'package:queries_firebase/chats_page.dart';
import 'package:queries_firebase/firebase_options.dart';
import 'package:queries_firebase/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    BlocProvider(
      create: (context) => QueriesBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(colorScheme: ColorScheme.dark()),
      home: HomePage(),
    );
  }
}
