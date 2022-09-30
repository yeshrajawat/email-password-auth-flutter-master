import 'package:crud/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  var apiKey = 'AIzaSyBWwl-YmatO4nwwjDD0N5BoIBPSQj025co';
  var appId = '1:647839138255:android:c49191eebb190af871d2ba';
  var projectId = 'assignment-b0f40';
  var messagingSenderId = '647839138255';
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyB2ZNBGAUDBkmkMiRAQV13JqYRlV6sqcJo',
          appId: '1:1067852675527:android:71e24e3e65ae90d149c1e2',
          messagingSenderId: '1067852675527',
          projectId: 'crud-flutter-40f4d'));
  runApp(MaterialApp(
    initialRoute: 'app',
    routes: {'app': (context) => App()},
  ));
}
