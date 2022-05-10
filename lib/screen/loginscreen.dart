// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'loginform.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _uidFocusNode = FocusNode();

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(3),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              'Login Screen',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    FutureBuilder(
                        future: _initializeFirebase(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Erro ao iniciar o Firebase');
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return LoginForm(focusNode: _uidFocusNode);
                          }
                          return CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.redAccent),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
