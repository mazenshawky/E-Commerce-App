// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/cart/data/models/cart_model.dart';
import 'package:e_commerce_app/modules/cart/domain/entities/cart.dart';
import 'package:e_commerce_app/modules/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/constants.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  final AddToCartUseCase addToCartUseCase;

  AddToCartCubit({required this.addToCartUseCase}) : super(AddToCartInitial());

  Future<void> addToCart(int productId, int userId) async {
    emit(AddToCartLoading());
    Either<Failure, void> response = await addToCartUseCase(CartModel(
      userId: userId,
      date: DateTime.now(),
      cartProducts: [CartProduct(productId: productId, quantity: 1)],
    ));

    emit(response.fold(
        (failure) =>
            AddToCartError(message: Constants.mapFailureToMsg(failure)),
        (success) => AddToCartSuccess()));
  }
}
