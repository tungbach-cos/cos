// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {

 int? get id; String? get name;@JsonKey(includeToJson: false) CategoryModel? get category;@JsonKey(includeToJson: false) UnitModel? get unit; String? get sku; String? get fullDescription; List<String>? get features; Map<String, dynamic>? get specifications; String? get imageUrl; double? get price; DateTime? get createdAt; DateTime? get updatedAt;@JsonKey(includeToJson: true, includeFromJson: false) int? get unitId;@JsonKey(includeToJson: true, includeFromJson: false) int? get categoryId;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.fullDescription, fullDescription) || other.fullDescription == fullDescription)&&const DeepCollectionEquality().equals(other.features, features)&&const DeepCollectionEquality().equals(other.specifications, specifications)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,unit,sku,fullDescription,const DeepCollectionEquality().hash(features),const DeepCollectionEquality().hash(specifications),imageUrl,price,createdAt,updatedAt,unitId,categoryId);

@override
String toString() {
  return 'ProductModel(id: $id, name: $name, category: $category, unit: $unit, sku: $sku, fullDescription: $fullDescription, features: $features, specifications: $specifications, imageUrl: $imageUrl, price: $price, createdAt: $createdAt, updatedAt: $updatedAt, unitId: $unitId, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 int? id, String? name,@JsonKey(includeToJson: false) CategoryModel? category,@JsonKey(includeToJson: false) UnitModel? unit, String? sku, String? fullDescription, List<String>? features, Map<String, dynamic>? specifications, String? imageUrl, double? price, DateTime? createdAt, DateTime? updatedAt,@JsonKey(includeToJson: true, includeFromJson: false) int? unitId,@JsonKey(includeToJson: true, includeFromJson: false) int? categoryId
});


$CategoryModelCopyWith<$Res>? get category;$UnitModelCopyWith<$Res>? get unit;

}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? category = freezed,Object? unit = freezed,Object? sku = freezed,Object? fullDescription = freezed,Object? features = freezed,Object? specifications = freezed,Object? imageUrl = freezed,Object? price = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? unitId = freezed,Object? categoryId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitModel?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,fullDescription: freezed == fullDescription ? _self.fullDescription : fullDescription // ignore: cast_nullable_to_non_nullable
as String?,features: freezed == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,specifications: freezed == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitModelCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $UnitModelCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductModel value)  $default,){
final _that = this;
switch (_that) {
case _ProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name, @JsonKey(includeToJson: false)  CategoryModel? category, @JsonKey(includeToJson: false)  UnitModel? unit,  String? sku,  String? fullDescription,  List<String>? features,  Map<String, dynamic>? specifications,  String? imageUrl,  double? price,  DateTime? createdAt,  DateTime? updatedAt, @JsonKey(includeToJson: true, includeFromJson: false)  int? unitId, @JsonKey(includeToJson: true, includeFromJson: false)  int? categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.unit,_that.sku,_that.fullDescription,_that.features,_that.specifications,_that.imageUrl,_that.price,_that.createdAt,_that.updatedAt,_that.unitId,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name, @JsonKey(includeToJson: false)  CategoryModel? category, @JsonKey(includeToJson: false)  UnitModel? unit,  String? sku,  String? fullDescription,  List<String>? features,  Map<String, dynamic>? specifications,  String? imageUrl,  double? price,  DateTime? createdAt,  DateTime? updatedAt, @JsonKey(includeToJson: true, includeFromJson: false)  int? unitId, @JsonKey(includeToJson: true, includeFromJson: false)  int? categoryId)  $default,) {final _that = this;
switch (_that) {
case _ProductModel():
return $default(_that.id,_that.name,_that.category,_that.unit,_that.sku,_that.fullDescription,_that.features,_that.specifications,_that.imageUrl,_that.price,_that.createdAt,_that.updatedAt,_that.unitId,_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name, @JsonKey(includeToJson: false)  CategoryModel? category, @JsonKey(includeToJson: false)  UnitModel? unit,  String? sku,  String? fullDescription,  List<String>? features,  Map<String, dynamic>? specifications,  String? imageUrl,  double? price,  DateTime? createdAt,  DateTime? updatedAt, @JsonKey(includeToJson: true, includeFromJson: false)  int? unitId, @JsonKey(includeToJson: true, includeFromJson: false)  int? categoryId)?  $default,) {final _that = this;
switch (_that) {
case _ProductModel() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.unit,_that.sku,_that.fullDescription,_that.features,_that.specifications,_that.imageUrl,_that.price,_that.createdAt,_that.updatedAt,_that.unitId,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductModel implements ProductModel {
  const _ProductModel({this.id, this.name, @JsonKey(includeToJson: false) this.category, @JsonKey(includeToJson: false) this.unit, this.sku, this.fullDescription, final  List<String>? features, final  Map<String, dynamic>? specifications, this.imageUrl, this.price, this.createdAt, this.updatedAt, @JsonKey(includeToJson: true, includeFromJson: false) this.unitId, @JsonKey(includeToJson: true, includeFromJson: false) this.categoryId}): _features = features,_specifications = specifications;
  factory _ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

@override final  int? id;
@override final  String? name;
@override@JsonKey(includeToJson: false) final  CategoryModel? category;
@override@JsonKey(includeToJson: false) final  UnitModel? unit;
@override final  String? sku;
@override final  String? fullDescription;
 final  List<String>? _features;
@override List<String>? get features {
  final value = _features;
  if (value == null) return null;
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _specifications;
@override Map<String, dynamic>? get specifications {
  final value = _specifications;
  if (value == null) return null;
  if (_specifications is EqualUnmodifiableMapView) return _specifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? imageUrl;
@override final  double? price;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
@override@JsonKey(includeToJson: true, includeFromJson: false) final  int? unitId;
@override@JsonKey(includeToJson: true, includeFromJson: false) final  int? categoryId;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductModelCopyWith<_ProductModel> get copyWith => __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.fullDescription, fullDescription) || other.fullDescription == fullDescription)&&const DeepCollectionEquality().equals(other._features, _features)&&const DeepCollectionEquality().equals(other._specifications, _specifications)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.price, price) || other.price == price)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,category,unit,sku,fullDescription,const DeepCollectionEquality().hash(_features),const DeepCollectionEquality().hash(_specifications),imageUrl,price,createdAt,updatedAt,unitId,categoryId);

@override
String toString() {
  return 'ProductModel(id: $id, name: $name, category: $category, unit: $unit, sku: $sku, fullDescription: $fullDescription, features: $features, specifications: $specifications, imageUrl: $imageUrl, price: $price, createdAt: $createdAt, updatedAt: $updatedAt, unitId: $unitId, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$ProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(_ProductModel value, $Res Function(_ProductModel) _then) = __$ProductModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name,@JsonKey(includeToJson: false) CategoryModel? category,@JsonKey(includeToJson: false) UnitModel? unit, String? sku, String? fullDescription, List<String>? features, Map<String, dynamic>? specifications, String? imageUrl, double? price, DateTime? createdAt, DateTime? updatedAt,@JsonKey(includeToJson: true, includeFromJson: false) int? unitId,@JsonKey(includeToJson: true, includeFromJson: false) int? categoryId
});


@override $CategoryModelCopyWith<$Res>? get category;@override $UnitModelCopyWith<$Res>? get unit;

}
/// @nodoc
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);

  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? category = freezed,Object? unit = freezed,Object? sku = freezed,Object? fullDescription = freezed,Object? features = freezed,Object? specifications = freezed,Object? imageUrl = freezed,Object? price = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? unitId = freezed,Object? categoryId = freezed,}) {
  return _then(_ProductModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as UnitModel?,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,fullDescription: freezed == fullDescription ? _self.fullDescription : fullDescription // ignore: cast_nullable_to_non_nullable
as String?,features: freezed == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>?,specifications: freezed == specifications ? _self._specifications : specifications // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unitId: freezed == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnitModelCopyWith<$Res>? get unit {
    if (_self.unit == null) {
    return null;
  }

  return $UnitModelCopyWith<$Res>(_self.unit!, (value) {
    return _then(_self.copyWith(unit: value));
  });
}
}

// dart format on
