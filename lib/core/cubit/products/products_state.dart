part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsError extends ProductsState {
  final String message;
  ProductsError({required this.message});
}

class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;
  ProductsSuccess({required this.products});
}
