import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';

abstract class DeshProductsRepo {
  Future<Either<Faliure, void>> addProduct(ProductEntity addProductInputEntity);
}
