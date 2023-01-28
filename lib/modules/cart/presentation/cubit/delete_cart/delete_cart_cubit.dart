// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/cart/domain/usecases/delete_cart_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/constants.dart';

part 'delete_cart_state.dart';

class DeleteCartCubit extends Cubit<DeleteCartState> {
  final DeleteCartUseCase deleteCartUseCase;

  DeleteCartCubit({required this.deleteCartUseCase})
      : super(DeleteCartInitial());

  Future<void> deleteCart({required int cartId}) async {
    emit(DeleteCartLoading());
    Either<Failure, void> response =
        await deleteCartUseCase(DeleteCartParameters(cartId: cartId));

    emit(response.fold(
        (failure) =>
            DeleteCartError(message: Constants.mapFailureToMsg(failure)),
        (success) => DeleteCartSuccess()));
  }
}
