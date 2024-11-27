import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/faliures.dart';
import 'package:e_commerce/core/repos/products_repo.dart';
import 'package:e_commerce/core/services/firestore_service.dart';
import 'package:e_commerce/core/utils/endpoind.dart';
import 'package:e_commerce/desh_board/features/add_product/data/models/add_product_input_model.dart';
import 'package:e_commerce/desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';

class ProductsRepoImpl implements ProductsRepo {
  final FirestoreService firestoreService;

  ProductsRepoImpl({required this.firestoreService});
  @override
  Future<Either<Faliure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await firestoreService.getDocumentsWithFilterAndSort(
        collectionPath: EndPoint.getProducts,
        sortField: 'sellingCount',
        descending: true,
        filterField: 'sellingCount',
        filterValue: 3,
      );
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      return right(products);
    } catch (e) {
      return left(ServerFaliure('failed to get products'));
    }
  }

  @override
  Future<Either<Faliure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await firestoreService.getAllDocuments(
          collectionPath: EndPoint.getProducts);
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      return right(products);
    } catch (e) {
      return left(ServerFaliure('failed to get products'));
    }
  }
}
