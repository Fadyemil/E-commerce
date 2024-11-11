import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/errors/exceptions.dart';

class FirestoreService  {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //~ Add a new document
  Future<void> addDocument({
    required String collectionPath,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    try {
      if (documentId != null) {
        await _firestore.collection(collectionPath).doc(documentId).set(data);
      } else {
        await _firestore.collection(collectionPath).add(data);
      }
      log('Document added successfully');
    } catch (e) {
      log('Exception in addDocument: $e');
      throw CustomException(message: 'حدث خطأ أثناء إضافة البيانات.');
    }
  }
}
