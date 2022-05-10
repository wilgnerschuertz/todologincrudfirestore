// ignore_for_file: prefer_final_fields, unused_field, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todoviews/screen/components/appbar.dart';

import '../../firestore/database.dart';
import 'edittodoform.dart';

class EditScreenTodo extends StatefulWidget {
  final String currentTitle;
  final String currentDescription;
  final String documentID;

  EditScreenTodo({
    required this.currentTitle,
    required this.currentDescription,
    required this.documentID,
  });

  @override
  State<EditScreenTodo> createState() => _EditScreenTodoState();
}

class _EditScreenTodoState extends State<EditScreenTodo> {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _titleFocusNode.unfocus();
        _descriptionFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: AppBarCustom(
            sectionName: 'Editar Todo',
          ),
          actions: [
            _isDeleting
                ? Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      right: 16,
                    ),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.red,
                      ),
                    ),
                  )
                : IconButton(
                    onPressed: () async {
                      setState(() {
                        _isDeleting = true;
                      });

                      await Database.deleteTodo(
                        docId: widget.documentID,
                      );

                      setState(() {
                        _isDeleting = false;
                      });

                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.delete),
                  )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 20,
            ),
            child: EditTodoForm(
              currentTitle: widget.currentTitle,
              currentDescription: widget.currentDescription,
              documentID: widget.documentID,
              descriptionFocusNode: _descriptionFocusNode,
              titleFocusNode: _titleFocusNode,
            ),
          ),
        ),
      ),
    );
  }
}
