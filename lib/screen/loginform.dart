// ignore_for_file: prefer_const_constructors_in_immutables, unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../firestore/validator.dart';
import '../utils/customform.dart';

class LoginForm extends StatefulWidget {
  final FocusNode focusNode;

  LoginForm({Key? key, required this.focusNode}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _uidController = TextEditingController();

  final _loginInFormKey = GlobalKey<FormState>();

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
                  label: 'Unique UserID',
                  hint: 'Enter your unique identifiquer',
                  validator: (value) => Validator.validatorUserId(
                    uid: value,
                  ),
                )
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
                    Colors.white,
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
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
