part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  const ProductsLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class FilteredProductsLoaded extends ProductsState {
  final List<Product> filteredProducts;

  const FilteredProductsLoaded({required this.filteredProducts});

  @override
  List<Object> get props => [filteredProducts];
}

class SortedProductsLoaded extends ProductsState {
  final List<Product> sortedProducts;

  const SortedProductsLoaded({required this.sortedProducts});

  @override
  List<Object> get props => [sortedProducts];
}

class LimitedProductsLoaded extends ProductsState {
  final List<Product> limitedProducts;

  const LimitedProductsLoaded({required this.limitedProducts});

  @override
  List<Object> get props => [limitedProducts];
}

class ProductsError extends ProductsState {
  final String message;

  const ProductsError({required this.message});

  @override
  List<Object> get props => [message];
}
