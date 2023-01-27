// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_freezed_data_classes.freezed.dart';

@freezed
class ProductObject with _$ProductObject {
  factory ProductObject({
    required String title,
    required double price,
    required String description,
    required String image,
    required String category,
  }) = _ProductObject;
}
