import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<Either<Faliure, List<ProductEntity>>> getProducts();
  Future<Either<Faliure, List<ProductEntity>>> getBestSellingProducts();
}
