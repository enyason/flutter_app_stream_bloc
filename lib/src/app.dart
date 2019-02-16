import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Test Stream Bloc",
      home: Scaffold(
//        appBar: AppBar(
//          title: Text("Test Stream Bloc"),
//        ),
        body: LogInScreen(),
      ),
    );
  }
}
