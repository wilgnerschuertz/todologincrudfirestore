// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  final String sectionName;

  const AppBarCustom({super.key, required this.sectionName});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 1),
        // Text(
        //     // 'Flutter CRUD',
        //     ),
        Text('$sectionName')
      ],
    );
  }
}
