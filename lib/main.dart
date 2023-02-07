import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/pages/login/login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: const Color.fromRGBO(5, 4, 43, 1),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(5, 4, 43, 1), //Color(0xFFF1FF0A),
        ),
        appBarTheme: const AppBarTheme(color: Color.fromRGBO(5, 4, 43, 1)),
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('Something has wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              return const MyHomePage() /*MyHomePage()*/;
            } else {
              return const Login();
            }
          }),
    );
  }
}
