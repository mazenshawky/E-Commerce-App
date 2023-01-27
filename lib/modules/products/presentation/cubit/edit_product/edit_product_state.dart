part of 'edit_product_cubit.dart';

abstract class EditProductState extends Equatable {
  const EditProductState();

  @override
  List<Object> get props => [];
}

class EditProductInitial extends EditProductState {}

class EditProductLoading extends EditProductState {}

class EditProductSuccess extends EditProductState {}

class EditProductError extends EditProductState {
  final String message;

  const EditProductError({required this.message});

  @override
  List<Object> get props => [message];
}
