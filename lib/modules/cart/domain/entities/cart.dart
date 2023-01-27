import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final int? id;
  final int? userId;
  final DateTime? date;
  final List<CartProduct>? cartProducts;

  const Cart({
    this.id,
    this.userId,
    this.date,
    this.cartProducts,
  });

  @override
  List<Object?> get props => [id, userId, date, cartProducts];
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
