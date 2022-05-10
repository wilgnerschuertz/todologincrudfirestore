// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todoviews/utils/customform.dart';

import '../../firestore/database.dart';
import '../../firestore/validator.dart';

class EditTodoForm extends StatefulWidget {
  final FocusNode titleFocusNode;
  final FocusNode descriptionFocusNode;
  final String currentTitle;
  final String currentDescription;
  final String documentID;

  EditTodoForm(
      {Key? key,
      required this.currentTitle,
      required this.currentDescription,
      required this.documentID,
      required this.titleFocusNode,
      required this.descriptionFocusNode})
      : super(key: key);

  @override
  State<EditTodoForm> createState() => _EditTodoFormState();
}

class _EditTodoFormState extends State<EditTodoForm> {
  final _updateTodoFormKey = GlobalKey<FormState>();
  bool _isProcessing = false;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String updateTitle = "";
  String updateDescription = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _updateTodoFormKey,
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
                    updateTitle = value;
                  },
                  label: 'Título',
                  hint: 'Editar Título',
                ),
                SizedBox(
                  height: 2,
                ),
                // Text(
                //   'Descrição',
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
                    updateDescription = value;
                  },
                  label: 'Descrição',
                  hint: 'Atualizar Descrição',
                ),
              ],
            ),
          ),
          _isProcessing
              ? Padding(
                  padding: EdgeInsets.all(2),
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        widget.titleFocusNode.unfocus();
                        widget.descriptionFocusNode.unfocus();

                        if (_updateTodoFormKey.currentState!.validate()) {
                          setState(() {
                            _isProcessing = true;
                          });

                          await Database.updateTodo(
                            docId: widget.documentID,
                            title: updateTitle,
                            description: updateDescription,
                          );

                          setState(() {
                            _isProcessing = false;
                          });

                          Navigator.of(context).pop();
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          'Editar',
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
