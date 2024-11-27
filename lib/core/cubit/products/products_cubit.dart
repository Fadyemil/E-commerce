import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/repos/products_repo.dart';
import 'package:e_commerce/desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold((failure) {
      emit(ProductsError(message: failure.message));
    }, (prodcts) {
      emit(ProductsSuccess(products: prodcts));
    });
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold((failure) {
      emit(ProductsError(message: failure.message));
    }, (prodcts) {
      emit(ProductsSuccess(products: prodcts));
    });
  }
}
