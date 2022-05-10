// ignore_for_file: unused_field, non_constant_identifier_names, prefer_const_constructors, todo

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
      obscureText: isObscure,
      textCapitalization:
          isCaptalized ? TextCapitalization.words : TextCapitalization.none,
      validator: (value) => _validator(value!),
      decoration: InputDecoration(
        labelText: isLabelEnabled ? _label : null,
        labelStyle: TextStyle(),
        hintText: _hint,
        hintStyle: TextStyle(),
        errorStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),

        //TODO: FOCUS SELECT
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            width: 1,
          ),
        ),

        //TODO: ENABLE INPUT ( INPUT SEM SELECAO)

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            width: 1,
          ),
        ),

        //TODO: ERROR INPUT
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            width: 1,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            width: 1,
          ),
        ),
      ),
    );
  }
}
