// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShopState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShopState()';
}


}




/// Adds pattern-matching-related methods to [ShopState].
extension ShopStatePatterns on ShopState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ShopInitial value)?  initial,TResult Function( ShopLoading value)?  loading,TResult Function( ShopSuccess value)?  success,TResult Function( ShopFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ShopInitial() when initial != null:
return initial(_that);case ShopLoading() when loading != null:
return loading(_that);case ShopSuccess() when success != null:
return success(_that);case ShopFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ShopInitial value)  initial,required TResult Function( ShopLoading value)  loading,required TResult Function( ShopSuccess value)  success,required TResult Function( ShopFailure value)  failure,}){
final _that = this;
switch (_that) {
case ShopInitial():
return initial(_that);case ShopLoading():
return loading(_that);case ShopSuccess():
return success(_that);case ShopFailure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ShopInitial value)?  initial,TResult? Function( ShopLoading value)?  loading,TResult? Function( ShopSuccess value)?  success,TResult? Function( ShopFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ShopInitial() when initial != null:
return initial(_that);case ShopLoading() when loading != null:
return loading(_that);case ShopSuccess() when success != null:
return success(_that);case ShopFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ProductModel> products,  String selectedCategory,  String sortBy)?  success,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ShopInitial() when initial != null:
return initial();case ShopLoading() when loading != null:
return loading();case ShopSuccess() when success != null:
return success(_that.products,_that.selectedCategory,_that.sortBy);case ShopFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ProductModel> products,  String selectedCategory,  String sortBy)  success,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case ShopInitial():
return initial();case ShopLoading():
return loading();case ShopSuccess():
return success(_that.products,_that.selectedCategory,_that.sortBy);case ShopFailure():
return failure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ProductModel> products,  String selectedCategory,  String sortBy)?  success,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case ShopInitial() when initial != null:
return initial();case ShopLoading() when loading != null:
return loading();case ShopSuccess() when success != null:
return success(_that.products,_that.selectedCategory,_that.sortBy);case ShopFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ShopInitial implements ShopState {
  const ShopInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShopState.initial()';
}


}




/// @nodoc


class ShopLoading implements ShopState {
  const ShopLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ShopState.loading()';
}


}




/// @nodoc


class ShopSuccess implements ShopState {
  const ShopSuccess({required final  List<ProductModel> products, required this.selectedCategory, required this.sortBy}): _products = products;
  

 final  List<ProductModel> _products;
 List<ProductModel> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

 final  String selectedCategory;
 final  String sortBy;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopSuccess&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),selectedCategory,sortBy);

@override
String toString() {
  return 'ShopState.success(products: $products, selectedCategory: $selectedCategory, sortBy: $sortBy)';
}


}




/// @nodoc


class ShopFailure implements ShopState {
  const ShopFailure(this.error);
  

 final  String error;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ShopState.failure(error: $error)';
}


}




// dart format on
