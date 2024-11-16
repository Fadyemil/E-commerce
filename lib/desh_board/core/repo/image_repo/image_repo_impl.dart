import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/desh_board/core/repo/image_repo/image_repo.dart';

class ImageRepoImpl implements ImageRepo {
  @override
  Future<Either<Faliure, String>> uploadImage(File image) {
    
  }
  
}