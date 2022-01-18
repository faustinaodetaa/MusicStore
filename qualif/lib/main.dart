import 'package:flutter/material.dart';
import 'package:qualif/views/pages/home.dart';
import 'package:qualif/views/pages/itemlist.dart';
import 'package:qualif/views/pages/login.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.purple[100], fontFamily: 'Quicksand'),
        home: Scaffold(
          body: LoginPage(),
        ));
  }
}
