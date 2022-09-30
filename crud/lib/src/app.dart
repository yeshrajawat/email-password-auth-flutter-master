import 'dart:html';

import 'package:crud/src/screens/home.dart';
import 'package:crud/src/screens/login.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _App createState() => _App();
}

class _App extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(accentColor: Colors.orange, primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
    // return Container(
    //   child: Scaffold(
    //     appBar: AppBar(title: Text("LoginPage")),
    //   ),
    // );
    // return Scaffold(
    //   appBar: AppBar(title: Text("Hi")),
    // );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     // return MaterialApp(
//     //   title: 'Login App',
//     //   theme: ThemeData(accentColor: Colors.orange, primarySwatch: Colors.blue),
//     //   home: LoginScreen(),
//     // );
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(title: Text("LoginPage")),
//       ),
//     );
//   }
// }
