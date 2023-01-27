// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductObject {
  String get title => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductObjectCopyWith<ProductObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductObjectCopyWith<$Res> {
  factory $ProductObjectCopyWith(
          ProductObject value, $Res Function(ProductObject) then) =
      _$ProductObjectCopyWithImpl<$Res, ProductObject>;
  @useResult
  $Res call(
      {String title,
      double price,
      String description,
      String image,
      String category});
}

/// @nodoc
class _$ProductObjectCopyWithImpl<$Res, $Val extends ProductObject>
    implements $ProductObjectCopyWith<$Res> {
  _$ProductObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? image = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductObjectCopyWith<$Res>
    implements $ProductObjectCopyWith<$Res> {
  factory _$$_ProductObjectCopyWith(
          _$_ProductObject value, $Res Function(_$_ProductObject) then) =
      __$$_ProductObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      double price,
      String description,
      String image,
      String category});
}

/// @nodoc
class __$$_ProductObjectCopyWithImpl<$Res>
    extends _$ProductObjectCopyWithImpl<$Res, _$_ProductObject>
    implements _$$_ProductObjectCopyWith<$Res> {
  __$$_ProductObjectCopyWithImpl(
      _$_ProductObject _value, $Res Function(_$_ProductObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? image = null,
    Object? category = null,
  }) {
    return _then(_$_ProductObject(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProductObject implements _ProductObject {
  _$_ProductObject(
      {required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category});

  @override
  final String title;
  @override
  final double price;
  @override
  final String description;
  @override
  final String image;
  @override
  final String category;

  @override
  String toString() {
    return 'ProductObject(title: $title, price: $price, description: $description, image: $image, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductObject &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, price, description, image, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductObjectCopyWith<_$_ProductObject> get copyWith =>
      __$$_ProductObjectCopyWithImpl<_$_ProductObject>(this, _$identity);
}

abstract class _ProductObject implements ProductObject {
  factory _ProductObject(
      {required final String title,
      required final double price,
      required final String description,
      required final String image,
      required final String category}) = _$_ProductObject;

  @override
  String get title;
  @override
  double get price;
  @override
  String get description;
  @override
  String get image;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_ProductObjectCopyWith<_$_ProductObject> get copyWith =>
      throw _privateConstructorUsedError;
}
