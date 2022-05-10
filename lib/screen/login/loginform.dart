// ignore_for_file: prefer_const_constructors_in_immutables, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../../firestore/database.dart';
import '../../firestore/validator.dart';
import '../../utils/customform.dart';
import '../homescreen.dart';

class LoginForm extends StatefulWidget {
  final FocusNode focusNode;

  LoginForm({Key? key, required this.focusNode}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _uidController = TextEditingController();

  final _loginInFormKey = GlobalKey<FormState>();

  String getId = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginInFormKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(1),
            child: Column(
              children: [
                CustomFormField(
                    controller: _uidController,
                    focusNode: widget.focusNode,
                    keyboardType: TextInputType.text,
                    inputAction: TextInputAction.done,
                    label: 'Entre com seu Usuário',
                    hint: 'Por Favor entre com seu Usuário!',
                    validator: (value) {
                      Validator.validatorUserId(
                        uid: value,
                      );
                      getId = value;
                    })
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 32),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 66, 216, 181),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  widget.focusNode.unfocus();

                  if (_loginInFormKey.currentState!.validate()) {
                    Database.userId = getId;

                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      // color: Colors.black,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
