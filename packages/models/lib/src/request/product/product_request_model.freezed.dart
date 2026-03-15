// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductRequestModel {

 String? get name;@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? get categoryId;@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? get unitId; String? get sku; String? get fullDescription;@JsonKey(fromJson: ProductRequestModel._nullableStringListFromJson) List<String>? get features;@JsonKey(fromJson: ProductRequestModel._nullableStringMapFromJson) Map<String, dynamic>? get specifications; String? get imageUrl;@JsonKey(fromJson: ParsingHelper.nullableDoubleFromJson) double? get price; DateTime? get updatedAt;
/// Create a copy of ProductRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductRequestModelCopyWith<ProductRequestModel> get copyWith => _$ProductRequestModelCopyWithImpl<ProductRequestModel>(this as ProductRequestModel, _$identity);

  /// Serializes this ProductRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.fullDescription, fullDescription) || other.fullDescription == fullDescription)&&const DeepCollectionEquality().equals(other.features, features)&&const DeepCollectionEquality().equals(other.specifications, specifications)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,categoryId,unitId,sku,fullDescription,const DeepCollectionEquality().hash(features),const DeepCollectionEquality().hash(specifications),imageUrl,price,updatedAt);

@override
String toString() {
  return 'ProductRequestModel(name: $name, categoryId: $categoryId, unitId: $unitId, sku: $sku, fullDescription: $fullDescription, features: $features, specifications: $specifications, imageUrl: $imageUrl, price: $price, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProductRequestModelCopyWith<$Res>  {
  factory $ProductRequestModelCopyWith(ProductRequestModel value, $Res Function(ProductRequestModel) _then) = _$ProductRequestModelCopyWithImpl;
@useResult
$Res call({
 String? name,@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? categoryId,@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? unitId, String? sku, String? fullDescription,@JsonKey(fromJson: ProductRequestModel._nullableStringListFromJson) List<String>? features,@JsonKey(fromJson: ProductRequestModel._nullableStringMapFromJson) Map<String, dynamic>? specifications, String? imageUrl,@JsonKey(fromJson: ParsingHelper.nullableDoubleFromJson) double? price, DateTime? updatedAt
});




}
/// @nodoc
class _$ProductRequestModelCopyWithImpl<$Res>
    implements $ProductRequestModelCopyWith<$Res> {
  _$ProductRequestModelCopyWithImpl(this._self, this._then);

  final ProductRequestModel _self;
  final $Res Function(ProductRequestModel) _then;

/// Create a copy of ProductRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? categoryId = freezed,Object? unitId = freezed,Object? sku = freezed,Object? fullDescription = freezed,Object? features = freezed,Object? specifications = freezed,Object? imageUrl = freezed,Object? price = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,fullDescription: freezed == fullDescription ? _self.fullDescription : fullDescription // ignore: cast_nullable_to_non_nullable
as String?,features: freezed == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,specifications: freezed == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductRequestModel].
extension ProductRequestModelPatterns on ProductRequestModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductRequestModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductRequestModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductRequestModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name, @JsonKey(fromJson: ParsingHelper.nullableIntFromJson)  int? categoryId, @JsonKey(fromJson: ParsingHelper.nullableIntFromJson)  int? unitId,  String? sku,  String? fullDescription, @JsonKey(fromJson: ProductRequestModel._nullableStringListFromJson)  List<String>? features, @JsonKey(fromJson: ProductRequestModel._nullableStringMapFromJson)  Map<String, dynamic>? specifications,  String? imageUrl, @JsonKey(fromJson: ParsingHelper.nullableDoubleFromJson)  double? price,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductRequestModel() when $default != null:
return $default(_that.name,_that.categoryId,_that.unitId,_that.sku,_that.fullDescription,_that.features,_that.specifications,_that.imageUrl,_that.price,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name, @JsonKey(fromJson: ParsingHelper.nullableIntFromJson)  int? categoryId, @JsonKey(fromJson: ParsingHelper.nullableIntFromJson)  int? unitId,  String? sku,  String? fullDescription, @JsonKey(fromJson: ProductRequestModel._nullableStringListFromJson)  List<String>? features, @JsonKey(fromJson: ProductRequestModel._nullableStringMapFromJson)  Map<String, dynamic>? specifications,  String? imageUrl, @JsonKey(fromJson: ParsingHelper.nullableDoubleFromJson)  double? price,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProductRequestModel():
return $default(_that.name,_that.categoryId,_that.unitId,_that.sku,_that.fullDescription,_that.features,_that.specifications,_that.imageUrl,_that.price,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name, @JsonKey(fromJson: ParsingHelper.nullableIntFromJson)  int? categoryId, @JsonKey(fromJson: ParsingHelper.nullableIntFromJson)  int? unitId,  String? sku,  String? fullDescription, @JsonKey(fromJson: ProductRequestModel._nullableStringListFromJson)  List<String>? features, @JsonKey(fromJson: ProductRequestModel._nullableStringMapFromJson)  Map<String, dynamic>? specifications,  String? imageUrl, @JsonKey(fromJson: ParsingHelper.nullableDoubleFromJson)  double? price,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProductRequestModel() when $default != null:
return $default(_that.name,_that.categoryId,_that.unitId,_that.sku,_that.fullDescription,_that.features,_that.specifications,_that.imageUrl,_that.price,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductRequestModel implements ProductRequestModel {
  const _ProductRequestModel({this.name, @JsonKey(fromJson: ParsingHelper.nullableIntFromJson) this.categoryId, @JsonKey(fromJson: ParsingHelper.nullableIntFromJson) this.unitId, this.sku, this.fullDescription, @JsonKey(fromJson: ProductRequestModel._nullableStringListFromJson) final  List<String>? features, @JsonKey(fromJson: ProductRequestModel._nullableStringMapFromJson) final  Map<String, dynamic>? specifications, this.imageUrl, @JsonKey(fromJson: ParsingHelper.nullableDoubleFromJson) this.price, this.updatedAt}): _features = features,_specifications = specifications;
  factory _ProductRequestModel.fromJson(Map<String, dynamic> json) => _$ProductRequestModelFromJson(json);

@override final  String? name;
@override@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) final  int? categoryId;
@override@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) final  int? unitId;
@override final  String? sku;
@override final  String? fullDescription;
 final  List<String>? _features;
@override@JsonKey(fromJson: ProductRequestModel._nullableStringListFromJson) List<String>? get features {
  final value = _features;
  if (value == null) return null;
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _specifications;
@override@JsonKey(fromJson: ProductRequestModel._nullableStringMapFromJson) Map<String, dynamic>? get specifications {
  final value = _specifications;
  if (value == null) return null;
  if (_specifications is EqualUnmodifiableMapView) return _specifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? imageUrl;
@override@JsonKey(fromJson: ParsingHelper.nullableDoubleFromJson) final  double? price;
@override final  DateTime? updatedAt;

/// Create a copy of ProductRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductRequestModelCopyWith<_ProductRequestModel> get copyWith => __$ProductRequestModelCopyWithImpl<_ProductRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.fullDescription, fullDescription) || other.fullDescription == fullDescription)&&const DeepCollectionEquality().equals(other._features, _features)&&const DeepCollectionEquality().equals(other._specifications, _specifications)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,categoryId,unitId,sku,fullDescription,const DeepCollectionEquality().hash(_features),const DeepCollectionEquality().hash(_specifications),imageUrl,price,updatedAt);

@override
String toString() {
  return 'ProductRequestModel(name: $name, categoryId: $categoryId, unitId: $unitId, sku: $sku, fullDescription: $fullDescription, features: $features, specifications: $specifications, imageUrl: $imageUrl, price: $price, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProductRequestModelCopyWith<$Res> implements $ProductRequestModelCopyWith<$Res> {
  factory _$ProductRequestModelCopyWith(_ProductRequestModel value, $Res Function(_ProductRequestModel) _then) = __$ProductRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? name,@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? categoryId,@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? unitId, String? sku, String? fullDescription,@JsonKey(fromJson: ProductRequestModel._nullableStringListFromJson) List<String>? features,@JsonKey(fromJson: ProductRequestModel._nullableStringMapFromJson) Map<String, dynamic>? specifications, String? imageUrl,@JsonKey(fromJson: ParsingHelper.nullableDoubleFromJson) double? price, DateTime? updatedAt
});




}
/// @nodoc
class __$ProductRequestModelCopyWithImpl<$Res>
    implements _$ProductRequestModelCopyWith<$Res> {
  __$ProductRequestModelCopyWithImpl(this._self, this._then);

  final _ProductRequestModel _self;
  final $Res Function(_ProductRequestModel) _then;

/// Create a copy of ProductRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? categoryId = freezed,Object? unitId = freezed,Object? sku = freezed,Object? fullDescription = freezed,Object? features = freezed,Object? specifications = freezed,Object? imageUrl = freezed,Object? price = freezed,Object? updatedAt = freezed,}) {
  return _then(_ProductRequestModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,fullDescription: freezed == fullDescription ? _self.fullDescription : fullDescription // ignore: cast_nullable_to_non_nullable
as String?,features: freezed == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,specifications: freezed == specifications ? _self._specifications : specifications // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
