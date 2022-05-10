// ignore_for_file: unused_element, unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('basedata');

class Database {
  // static String? todoId;
  static String? userId;

  static Future<void> addTodo({
    required String title,
    required String description,
  }) async {
    print(' -----------> Seu ID <----------- ');
    print(userId);
    print(' -----------> ID OK  <----------- ');
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('todo').doc();

    Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'description': description
    };

    await documentReference
        .set(data)
        .whenComplete(() => print(
              'TODO CRIADO COM SUCESSO',
            ))
        .catchError((e) => print(e));
  }

  static Future<void> updateTodo({
    required String title,
    required String description,
    required docId,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('todo').doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      'title': title,
      'description': description
    };

    await documentReference
        .set(data)
        .whenComplete(() => print(
              'TODO ATUALIZADO COM SUCESSO',
            ))
        .catchError((e) => print(e));
  }

  //TODO: Ver somente o que o USUARIO ATUAL CADASTROU
  static Stream<QuerySnapshot> readTodo() {
    CollectionReference notesTodoCollection =
        _mainCollection.doc(userId).collection('todo');

    return notesTodoCollection.snapshots();
  }

  static Future<void> deleteTodo({
    required String docId,
  }) async {
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('todo').doc(docId);

    await documentReference
        .delete()
        .whenComplete(() => print('TODO DELETADO COM SUCESSO'))
        .catchError((e) => print(e));
  }
}
