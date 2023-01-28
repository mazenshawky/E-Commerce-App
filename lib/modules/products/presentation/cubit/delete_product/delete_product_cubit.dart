// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/products/domain/usecases/delete_product_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/constants.dart';

part 'delete_product_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  final DeleteProductUseCase deleteProductUseCase;

  DeleteProductCubit({required this.deleteProductUseCase})
      : super(DeleteProductInitial());

  Future<void> deleteProduct({required int productId}) async {
    emit(DeleteProductLoading());
    Either<Failure, void> response = await deleteProductUseCase(
        DeleteProductParameters(productId: productId));

    emit(response.fold(
        (failure) =>
            DeleteProductError(message: Constants.mapFailureToMsg(failure)),
        (success) => DeleteProductSuccess()));
  }
}
