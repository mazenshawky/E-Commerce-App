// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/app/app_prefs.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/cart/domain/entities/cart.dart';
import 'package:e_commerce_app/modules/cart/domain/usecases/get_cart_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../products/domain/entities/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;
  final AppPreferences appPreferences;

  CartCubit({required this.getCartUseCase, required this.appPreferences})
      : super(CartInitial());

  Future<void> getCart() async {
    emit(CartLoading());
    Either<Failure, Cart> response =
        await getCartUseCase(UserParameters(userId: _getUserId()));

    emit(response.fold(
        (failure) => CartError(message: Constants.mapFailureToMsg(failure)),
        (cart) => CartLoaded(cart: cart)));
  }

  List<Product> filterProductsAsUserCart(List<Product> allProudcts, Cart cart) {
    final filteredProducts = allProudcts
        .where((product) => cart.cartProducts!
            .any((cartProduct) => cartProduct.productId == product.id))
        .toList();
    return filteredProducts;
  }

  double calculateCartTotalPrice(List<Product> products) {
    double sum = 0;

    for (var product in products) {
      sum += product.price;
    }

    return sum;
  }

  int _getUserId() => appPreferences.getUserId();

  void logout() => appPreferences.logout();
}
