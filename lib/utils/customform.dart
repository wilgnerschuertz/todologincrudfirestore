// ignore_for_file: unused_field, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  CustomFormField({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    required TextInputType keyboardType,
    required TextInputAction inputAction,
    required String label,
    required String hint,
    required Function(String value) validator,
    this.isObscure = false,
    this.isCaptalized = false,
    this.maxLines = 1,
    this.isLabelEnabled = false,
  })  :
        // _keyboardType = keyboardType,
        //       _inputAction = inputAction,
        _label = label,
        _hint = hint,
        _validator = validator,
        super(key: key);

  // final TextInputType = _keyboardType;
  // final TextInputAction = _inputAction;
  final String _label;
  final String _hint;
  final bool isObscure;
  final bool isCaptalized;
  final int maxLines;
  final bool isLabelEnabled;
  final Function(String) _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // maxLines = maxLines,
      // keyboardType = _keyboardType,
      obscureText: isObscure,
      textCapitalization:
          isCaptalized ? TextCapitalization.words : TextCapitalization.none,
      // textInputAction: _inputAction,
      cursorColor: Colors.white,
      validator: (value) => _validator(value!),
      decoration: InputDecoration(
        labelText: isLabelEnabled ? _label : null,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintText: _hint,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.blueGrey,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 1,
          ),
        ),
      ),
    );
  }
}
