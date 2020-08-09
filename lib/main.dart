import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:videocall_test_3rdwheel/resources/firebase_repository.dart';
import 'package:videocall_test_3rdwheel/screens/home_screen.dart';
import 'package:videocall_test_3rdwheel/screens/login_screen.dart';
import 'package:videocall_test_3rdwheel/screens/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseRepository _repository = FirebaseRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "VideoCall",
      debugShowMaterialGrid: false,
      initialRoute: "/", //This main.dart is our first page
      routes: {
        'search_screen': (context) => searchScreen(),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
