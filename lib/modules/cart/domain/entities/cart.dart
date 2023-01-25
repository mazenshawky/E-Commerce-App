import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final int id;
  final List<CartProduct> cartProducts;

  const Cart({
    required this.id,
    required this.cartProducts,
  });

  @override
  List<Object?> get props => [id, cartProducts];
}

class CartProduct extends Equatable {
  final int productId;
  final int quantity;

  const CartProduct({
    required this.productId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [productId, quantity];
}
