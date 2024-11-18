import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/services/firestore_service.dart';
import 'package:e_commerce/core/utils/endpoind.dart';
import 'package:e_commerce/desh_board/core/repo/poduct_repo/products_repo.dart';
import 'package:e_commerce/desh_board/features/add_product/data/models/add_product_input_model.dart';
import 'package:e_commerce/desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';

class ProductsRepoImpl extends ProductsRepo {
  final FirestoreService firestoreService;

  ProductsRepoImpl({required this.firestoreService});
  @override
  Future<Either<Faliure, void>> addProduct(
      AddProductInputEntity addProductInputEntity) async {
    try {
      await firestoreService.addDocument(
        collectionPath: EndPoint.addProduct,
        data: AddProductInputModel.fromEntity(addProductInputEntity).toJson(),
      );
      return Right(null);
    } catch (error) {
      return Left(ServerFaliure(error.toString()));
    }
  }
}
