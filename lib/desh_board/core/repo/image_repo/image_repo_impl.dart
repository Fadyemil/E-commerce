import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/utils/endpoind.dart';
import 'package:e_commerce/desh_board/core/repo/image_repo/image_repo.dart';
import 'package:e_commerce/desh_board/core/server/supabase_storage_server.dart';
// import 'package:e_commerce/desh_board/core/server/fire_storage.dart';

class ImageRepoImpl implements ImageRepo {
  // final FireStorageService fireStorageService;
  final SupabaseStorageServer supabaseStorageServer;

  ImageRepoImpl({required this.supabaseStorageServer});
  @override
  Future<Either<Faliure, String>> uploadImage(File image) async {
    try {
      String? imageUrl =
          await supabaseStorageServer.uploadFile(image, EndPoint.images);
      return Right(imageUrl!);
    } catch (e) {
      log('Exception in addDocument: $e');
      throw CustomException(message: 'حدث خطأ أثناء إضافة البيانات.');
    }
  }
}
