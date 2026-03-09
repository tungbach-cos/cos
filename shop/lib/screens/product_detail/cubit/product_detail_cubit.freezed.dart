// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailState()';
}


}




/// Adds pattern-matching-related methods to [ProductDetailState].
extension ProductDetailStatePatterns on ProductDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductDetailInitial value)?  initial,TResult Function( ProductDetailLoading value)?  loading,TResult Function( ProductDetailSuccess value)?  success,TResult Function( ProductDetailNotFound value)?  notFound,TResult Function( ProductDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductDetailInitial() when initial != null:
return initial(_that);case ProductDetailLoading() when loading != null:
return loading(_that);case ProductDetailSuccess() when success != null:
return success(_that);case ProductDetailNotFound() when notFound != null:
return notFound(_that);case ProductDetailFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductDetailInitial value)  initial,required TResult Function( ProductDetailLoading value)  loading,required TResult Function( ProductDetailSuccess value)  success,required TResult Function( ProductDetailNotFound value)  notFound,required TResult Function( ProductDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProductDetailInitial():
return initial(_that);case ProductDetailLoading():
return loading(_that);case ProductDetailSuccess():
return success(_that);case ProductDetailNotFound():
return notFound(_that);case ProductDetailFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductDetailInitial value)?  initial,TResult? Function( ProductDetailLoading value)?  loading,TResult? Function( ProductDetailSuccess value)?  success,TResult? Function( ProductDetailNotFound value)?  notFound,TResult? Function( ProductDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProductDetailInitial() when initial != null:
return initial(_that);case ProductDetailLoading() when loading != null:
return loading(_that);case ProductDetailSuccess() when success != null:
return success(_that);case ProductDetailNotFound() when notFound != null:
return notFound(_that);case ProductDetailFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ProductModel product,  List<ProductModel> relatedProducts,  CompanyInfoModel companyInfo)?  success,TResult Function()?  notFound,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductDetailInitial() when initial != null:
return initial();case ProductDetailLoading() when loading != null:
return loading();case ProductDetailSuccess() when success != null:
return success(_that.product,_that.relatedProducts,_that.companyInfo);case ProductDetailNotFound() when notFound != null:
return notFound();case ProductDetailFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ProductModel product,  List<ProductModel> relatedProducts,  CompanyInfoModel companyInfo)  success,required TResult Function()  notFound,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case ProductDetailInitial():
return initial();case ProductDetailLoading():
return loading();case ProductDetailSuccess():
return success(_that.product,_that.relatedProducts,_that.companyInfo);case ProductDetailNotFound():
return notFound();case ProductDetailFailure():
return failure(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ProductModel product,  List<ProductModel> relatedProducts,  CompanyInfoModel companyInfo)?  success,TResult? Function()?  notFound,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case ProductDetailInitial() when initial != null:
return initial();case ProductDetailLoading() when loading != null:
return loading();case ProductDetailSuccess() when success != null:
return success(_that.product,_that.relatedProducts,_that.companyInfo);case ProductDetailNotFound() when notFound != null:
return notFound();case ProductDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ProductDetailInitial implements ProductDetailState {
  const ProductDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailState.initial()';
}


}




/// @nodoc


class ProductDetailLoading implements ProductDetailState {
  const ProductDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailState.loading()';
}


}




/// @nodoc


class ProductDetailSuccess implements ProductDetailState {
  const ProductDetailSuccess({required this.product, required final  List<ProductModel> relatedProducts, required this.companyInfo}): _relatedProducts = relatedProducts;
  

 final  ProductModel product;
 final  List<ProductModel> _relatedProducts;
 List<ProductModel> get relatedProducts {
  if (_relatedProducts is EqualUnmodifiableListView) return _relatedProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_relatedProducts);
}

 final  CompanyInfoModel companyInfo;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailSuccess&&(identical(other.product, product) || other.product == product)&&const DeepCollectionEquality().equals(other._relatedProducts, _relatedProducts)&&(identical(other.companyInfo, companyInfo) || other.companyInfo == companyInfo));
}


@override
int get hashCode => Object.hash(runtimeType,product,const DeepCollectionEquality().hash(_relatedProducts),companyInfo);

@override
String toString() {
  return 'ProductDetailState.success(product: $product, relatedProducts: $relatedProducts, companyInfo: $companyInfo)';
}


}




/// @nodoc


class ProductDetailNotFound implements ProductDetailState {
  const ProductDetailNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailState.notFound()';
}


}




/// @nodoc


class ProductDetailFailure implements ProductDetailState {
  const ProductDetailFailure(this.error);
  

 final  String error;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ProductDetailState.failure(error: $error)';
}


}




// dart format on
