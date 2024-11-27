// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as b;

class FireStorageService {
  //~ Firebase Storage reference
  final storageReference = FirebaseStorage.instance.ref();

  ///~ Uploads a file to Firebase Storage and returns its download URL
  Future<String?> uploadFile(File file, String path) async {
    try {
      String fileName = b.basenameWithoutExtension(file.path);
      String extensionName = b.extension(file.path);

      var fileReference =
          storageReference.child('$path/$fileName$extensionName');
      await fileReference.putFile(file);

      String fileUrl = await fileReference.getDownloadURL();
      return fileUrl;
    } catch (e) {
      log("Error uploading file: $e");
      throw CustomException(message: 'حدث خطأ أثناء إضافة البيانات.');
    }
  }

  ///~ Deletes a file from Firebase Storage based on its download URL
  Future<bool> deleteFile(String fileUrl) async {
    try {
      var fileReference = FirebaseStorage.instance.refFromURL(fileUrl);
      await fileReference.delete();
      return true;
    } catch (e) {
      log("Error deleting file: $e");
      throw CustomException(message: 'حدث خطأ أثناء إضافة البيانات.');
    }
  }

  ///~ Updates an existing file in Firebase Storage by replacing it with a new one
  Future<String?> updateFile(File file, String fileUrl) async {
    try {
      await deleteFile(fileUrl);
      String? newUrl = await uploadFile(file, "updated_files");
      return newUrl;
    } catch (e) {
      log("Error updating file: $e");
      throw CustomException(message: 'حدث خطأ أثناء إضافة البيانات.');
    }
  }

  ///~ Downloads a file from Firebase Storage and returns its data as Uint8List
  Future<Uint8List?> downloadFile(String fileUrl) async {
    try {
      var fileReference = FirebaseStorage.instance.refFromURL(fileUrl);
      Uint8List? data = await fileReference.getData();
      return data;
    } catch (e) {
      log("Error downloading file: $e");
      throw CustomException(message: 'حدث خطأ أثناء إضافة البيانات.');
    }
  }

  ///~ Retrieves the download URL of a file from Firebase Storage based on its path
  Future<String?> getFileUrl(String path) async {
    try {
      var fileReference = storageReference.child(path);
      String fileUrl = await fileReference.getDownloadURL();
      return fileUrl;
    } catch (e) {
      log("Error getting file URL: $e");
      throw CustomException(message: 'حدث خطأ أثناء إضافة البيانات.');
    }
  }
}
