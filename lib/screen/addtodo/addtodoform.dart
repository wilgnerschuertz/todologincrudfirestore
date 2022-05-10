// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../firestore/database.dart';
import '../../firestore/validator.dart';
import '../../utils/customform.dart';

class AddTodoForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;

  const AddTodoForm({
    required this.titleFocusNode,
    required this.descriptionFocusNode,
  });

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final _addTodoFormKey = GlobalKey<FormState>();
  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String getTitle = "";
  String getDescription = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addTodoFormKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                ),
                // Text(
                //   'Title',
                //   style: TextStyle(
                //     fontSize: 22,
                //     letterSpacing: 2,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                SizedBox(
                  height: 8,
                ),
                CustomFormField(
                  isLabelEnabled: false,
                  controller: _titleController,
                  focusNode: widget.titleFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) {
                    Validator.validateField(
                      value: value,
                    );
                    getTitle = value;
                  },
                  label: 'Título',
                  hint: 'Seu Título Aqui!',
                ),
                SizedBox(
                  height: 20,
                ),
                // Text(
                //   'Description',
                //   style: TextStyle(
                //     fontSize: 22,
                //     letterSpacing: 2,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                SizedBox(
                  height: 8,
                ),
                CustomFormField(
                  maxLines: 10,
                  isLabelEnabled: false,
                  controller: _descriptionController,
                  focusNode: widget.descriptionFocusNode,
                  keyboardType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  validator: (value) {
                    Validator.validateField(
                      value: value,
                    );
                    getDescription = value;
                  },
                  label: 'Descrição',
                  hint: 'Sua Descrição Aqui!',
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    // child: Text('TESTE ADD TODO'),
                    onPressed: () async {
                      // widget.titleFocusNode.unfocus();
                      // widget.descriptionFocusNode.unfocus();

                      if (_addTodoFormKey.currentState!.validate()) {
                        setState(() {
                          _isProcessing = true;
                        });

                        await Database.addTodo(
                          title: getTitle,
                          description: getDescription,
                        );

                        setState(() {
                          _isProcessing = false;
                        });

                        Navigator.of(context).pop();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      child: Text(
                        'Add Todo',
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
