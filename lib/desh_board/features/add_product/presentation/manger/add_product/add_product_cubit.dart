import 'package:bloc/bloc.dart';
import 'package:e_commerce/desh_board/core/repo/image_repo/image_repo.dart';
import 'package:e_commerce/desh_board/core/repo/poduct_repo/products_repo.dart';
import 'package:e_commerce/desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productsRepo)
      : super(AddProductInitial());
  final ImageRepo imageRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await productsRepo.addProduct(addProductInputEntity);
    result.fold((f) {
      emit(AddProductFailure(errorMessage: f.toString()));
    }, (product) {
      emit(AddProductSuccess());
    });
  }

  // Future<void> addProduct(AddProductInputEntity addProductInputEntity) async {
  //   emit(AddProductLoading());
  //   var result = await imageRepo.uploadImage(addProductInputEntity.image);
  //   result.fold((f) {
  //     emit(AddProductFailure(errorMessage: f.toString()));
  //   }, (url) async {
  //     addProductInputEntity.imageUrl = url;
  //     var result = await productsRepo.addProduct(addProductInputEntity);
  //     result.fold((f) {
  //       emit(AddProductFailure(errorMessage: f.toString()));
  //     }, (product) {
  //       emit(AddProductSuccess());
  //     });
  //   });
  // }
}
