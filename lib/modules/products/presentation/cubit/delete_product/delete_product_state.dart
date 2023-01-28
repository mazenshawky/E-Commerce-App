part of 'delete_product_cubit.dart';

abstract class DeleteProductState extends Equatable {
  const DeleteProductState();

  @override
  List<Object> get props => [];
}

class DeleteProductInitial extends DeleteProductState {}

class DeleteProductLoading extends DeleteProductState {}

class DeleteProductSuccess extends DeleteProductState {}

class DeleteProductError extends DeleteProductState {
  final String message;

  const DeleteProductError({required this.message});

  @override
  List<Object> get props => [message];
}
