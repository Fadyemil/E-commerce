// ignore_for_file: inference_failure_on_function_return_type, always_declare_return_types, type_annotate_public_apis

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:path/path.dart' as b;
import 'package:e_commerce/desh_board/core/server/storage_server_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageServer implements StorageServerRepo {
  static late Supabase _supabase;

  static createBuckets(String bucketName) async {
    try {
      var buckets = await _supabase.client.storage.listBuckets();
      log('Buckets: $buckets');

      bool isBucketExists = false;
      for (var bucket in buckets) {
        if (bucket.id == bucketName) {
          isBucketExists = true;
          break;
        }
      }

      if (!isBucketExists) {
        log('Creating bucket: $bucketName');
        await _supabase.client.storage.createBucket(bucketName);
        log('Bucket created successfully.');
      } else {
        log('Bucket already exists: $bucketName');
      }
    } catch (e) {
      log("Error creating bucket: $e");
      throw CustomException(message: 'حدث خطأ أثناء إنشاء السلة.');
    }
  }

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://jjfnqrvkebweapmofqtn.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpqZm5xcnZrZWJ3ZWFwbW9mcXRuIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTczMjk2OTE4NywiZXhwIjoyMDQ4NTQ1MTg3fQ.g9eMqhYOw7FKdzPQbTaqHhTa9wELCxL7ZVVtqj7GgKQ',
    );
  }

  @override
  Future<String?> uploadFile(File file, String path) async {
    try {
      String fileName = b.basename(file.path);
      String extensionName = b.extension(file.path);
      var resutl = await _supabase.client.storage
          .from('fruits_images')
          .upload('$path/$fileName.$extensionName', file);

      return resutl;
    } on Exception catch (e) {
      log("Error uploading file: $e");
      throw CustomException(message: 'حدث خطأ أثناء إضافة البيانات.');
    }
  }

  @override
  Future<String?> updateFile(File file, String fileUrl) async {
    try {
      await deleteFile(fileUrl);
      String fileName = b.basename(file.path);
      String extensionName = b.extension(file.path);
      var result = await _supabase.client.storage
          .from('fruits_images')
          .upload('$fileName.$extensionName', file);

      return result;
    } on Exception catch (e) {
      log("Error updating file: $e");
      throw CustomException(message: 'حدث خطأ أثناء تحديث الملف.');
    }
  }

  @override
  Future<bool> deleteFile(String fileUrl) async {
    try {
      String fileName = fileUrl.split('/').last;
      var result = await _supabase.client.storage
          .from('fruits_images')
          .remove([fileName]);

      if (result.isEmpty) {
        return true; // الملف تم حذفه بنجاح.
      } else {
        return false; // حدث خطأ أثناء الحذف.
      }
    } on Exception catch (e) {
      log("Error deleting file: $e");
      throw CustomException(message: 'حدث خطأ أثناء حذف الملف.');
    }
  }

  @override
  Future<Uint8List?> downloadFile(String fileUrl) async {
    try {
      String fileName = fileUrl.split('/').last;
      var result = await _supabase.client.storage
          .from('fruits_images')
          .download(fileName);

      return result;
    } on Exception catch (e) {
      log("Error downloading file: $e");
      throw CustomException(message: 'حدث خطأ أثناء تحميل الملف.');
    }
  }

  @override
  Future<String?> getFileUrl(String path) async {
    try {
      var publicUrl =
          _supabase.client.storage.from('fruits_images').getPublicUrl(path);
      return publicUrl;
    } on Exception catch (e) {
      log("Error getting file URL: $e");
      throw CustomException(message: 'حدث خطأ أثناء الحصول على رابط الملف.');
    }
  }
}
