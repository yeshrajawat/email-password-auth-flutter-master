import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
        // ignore: prefer_const_constructors
        child: Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              keyboardType: TextInputType.emailAddress,
              
              decoration: InputDecoration(hintText: 'Email'), 
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
               style: ElevatedButton.styleFrom( primary: Colors.blueGrey), 
                onPressed: () async {
                  try {
                    UserCredential userCredential =
                        await auth.signInWithEmailAndPassword(
                            email: _email, password: _password);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('SignIn')),
            ElevatedButton(
              style: ElevatedButton.styleFrom( primary: Colors.blueGrey), 
                onPressed: () async {
                  try {
                    UserCredential userCredential =
                        await auth.createUserWithEmailAndPassword(
                            email: _email, password: _password);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      print('The account already exists for this email.');
                    } else if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    }
                  } catch (e) {
                    print(e);
                  }
                  // auth.createUserWithEmailAndPassword(
                  //     email: _email, password: _password);
                  // Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Text('SignUp'))
          ],
        )
      ]),
    ));
  }
}
