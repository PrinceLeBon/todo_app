import 'package:flutter/material.dart';
import 'package:todo_app/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Color.fromRGBO(5, 4, 43, 1),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:  Color.fromRGBO(5, 4, 43, 1),//Color(0xFFF1FF0A),
        ),
        appBarTheme: AppBarTheme(
            color: Color.fromRGBO(5, 4, 43, 1)
        ),

      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}