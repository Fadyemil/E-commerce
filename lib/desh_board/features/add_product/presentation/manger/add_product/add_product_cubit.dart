import 'package:bloc/bloc.dart';
import 'package:e_commerce/desh_board/core/repo/image_repo/image_repo.dart';
import 'package:e_commerce/desh_board/core/repo/poduct_repo/desh_products_repo.dart';
import 'package:e_commerce/desh_board/features/add_product/dmain/entites/add_product_input_entity.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productsRepo)
      : super(AddProductInitial());
  final ImageRepo imageRepo;
  final DeshProductsRepo productsRepo;

  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController nameContoller = TextEditingController();
  TextEditingController priceContoller = TextEditingController();
  TextEditingController expirationContoller = TextEditingController();
  TextEditingController numCaloriesContoller = TextEditingController();
  TextEditingController unitAmountContoller = TextEditingController();
  TextEditingController codeContoller = TextEditingController();
  TextEditingController desContoller = TextEditingController();

  // Future<void> addProduct(ProductEntity addProductInputEntity) async {
  //   emit(AddProductLoading());
  //   var result = await productsRepo.addProduct(addProductInputEntity);
  //   result.fold((f) {
  //     emit(AddProductFailure(errorMessage: f.toString()));
  //   }, (product) {
  //     emit(AddProductSuccess());
  //   });
  // }

  Future<void> addProduct(ProductEntity addProductInputEntity) async {
    emit(AddProductLoading());
    var result = await imageRepo.uploadImage(addProductInputEntity.image);
    await result.fold((f) {
      emit(AddProductFailure(errorMessage: f.toString()));
    }, (url) async {
      final updatedEntity = addProductInputEntity.copyWith(
        image: null,
        imageUrl: url,
      );

      var result = await productsRepo.addProduct(updatedEntity);
      result.fold((f) {
        emit(AddProductFailure(errorMessage: f.toString()));
      }, (product) {
        emit(AddProductSuccess());
      });
    });
  }
}
