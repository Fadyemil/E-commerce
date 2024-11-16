import 'package:e_commerce/desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<void> addProduct(AddProductInputEntity addProductInputEntity);
  
}