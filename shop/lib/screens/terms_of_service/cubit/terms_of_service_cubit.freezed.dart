// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_of_service_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TermsOfServiceState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsOfServiceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TermsOfServiceState()';
}


}




/// Adds pattern-matching-related methods to [TermsOfServiceState].
extension TermsOfServiceStatePatterns on TermsOfServiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TermsOfServiceInitial value)?  initial,TResult Function( TermsOfServiceLoading value)?  loading,TResult Function( TermsOfServiceSuccess value)?  success,TResult Function( TermsOfServiceFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TermsOfServiceInitial() when initial != null:
return initial(_that);case TermsOfServiceLoading() when loading != null:
return loading(_that);case TermsOfServiceSuccess() when success != null:
return success(_that);case TermsOfServiceFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TermsOfServiceInitial value)  initial,required TResult Function( TermsOfServiceLoading value)  loading,required TResult Function( TermsOfServiceSuccess value)  success,required TResult Function( TermsOfServiceFailure value)  failure,}){
final _that = this;
switch (_that) {
case TermsOfServiceInitial():
return initial(_that);case TermsOfServiceLoading():
return loading(_that);case TermsOfServiceSuccess():
return success(_that);case TermsOfServiceFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TermsOfServiceInitial value)?  initial,TResult? Function( TermsOfServiceLoading value)?  loading,TResult? Function( TermsOfServiceSuccess value)?  success,TResult? Function( TermsOfServiceFailure value)?  failure,}){
final _that = this;
switch (_that) {
case TermsOfServiceInitial() when initial != null:
return initial(_that);case TermsOfServiceLoading() when loading != null:
return loading(_that);case TermsOfServiceSuccess() when success != null:
return success(_that);case TermsOfServiceFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TermsOfServiceModel terms,  CompanyInfoModel companyInfo)?  success,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TermsOfServiceInitial() when initial != null:
return initial();case TermsOfServiceLoading() when loading != null:
return loading();case TermsOfServiceSuccess() when success != null:
return success(_that.terms,_that.companyInfo);case TermsOfServiceFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TermsOfServiceModel terms,  CompanyInfoModel companyInfo)  success,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case TermsOfServiceInitial():
return initial();case TermsOfServiceLoading():
return loading();case TermsOfServiceSuccess():
return success(_that.terms,_that.companyInfo);case TermsOfServiceFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TermsOfServiceModel terms,  CompanyInfoModel companyInfo)?  success,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case TermsOfServiceInitial() when initial != null:
return initial();case TermsOfServiceLoading() when loading != null:
return loading();case TermsOfServiceSuccess() when success != null:
return success(_that.terms,_that.companyInfo);case TermsOfServiceFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class TermsOfServiceInitial implements TermsOfServiceState {
  const TermsOfServiceInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsOfServiceInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TermsOfServiceState.initial()';
}


}




/// @nodoc


class TermsOfServiceLoading implements TermsOfServiceState {
  const TermsOfServiceLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsOfServiceLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TermsOfServiceState.loading()';
}


}




/// @nodoc


class TermsOfServiceSuccess implements TermsOfServiceState {
  const TermsOfServiceSuccess({required this.terms, required this.companyInfo});
  

 final  TermsOfServiceModel terms;
 final  CompanyInfoModel companyInfo;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsOfServiceSuccess&&(identical(other.terms, terms) || other.terms == terms)&&(identical(other.companyInfo, companyInfo) || other.companyInfo == companyInfo));
}


@override
int get hashCode => Object.hash(runtimeType,terms,companyInfo);

@override
String toString() {
  return 'TermsOfServiceState.success(terms: $terms, companyInfo: $companyInfo)';
}


}




/// @nodoc


class TermsOfServiceFailure implements TermsOfServiceState {
  const TermsOfServiceFailure(this.error);
  

 final  String error;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsOfServiceFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'TermsOfServiceState.failure(error: $error)';
}


}




// dart format on
