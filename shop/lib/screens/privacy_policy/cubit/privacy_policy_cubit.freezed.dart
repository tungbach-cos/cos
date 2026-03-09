// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_policy_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrivacyPolicyState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacyPolicyState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrivacyPolicyState()';
}


}




/// Adds pattern-matching-related methods to [PrivacyPolicyState].
extension PrivacyPolicyStatePatterns on PrivacyPolicyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PrivacyPolicyInitial value)?  initial,TResult Function( PrivacyPolicyLoading value)?  loading,TResult Function( PrivacyPolicySuccess value)?  success,TResult Function( PrivacyPolicyFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PrivacyPolicyInitial() when initial != null:
return initial(_that);case PrivacyPolicyLoading() when loading != null:
return loading(_that);case PrivacyPolicySuccess() when success != null:
return success(_that);case PrivacyPolicyFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PrivacyPolicyInitial value)  initial,required TResult Function( PrivacyPolicyLoading value)  loading,required TResult Function( PrivacyPolicySuccess value)  success,required TResult Function( PrivacyPolicyFailure value)  failure,}){
final _that = this;
switch (_that) {
case PrivacyPolicyInitial():
return initial(_that);case PrivacyPolicyLoading():
return loading(_that);case PrivacyPolicySuccess():
return success(_that);case PrivacyPolicyFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PrivacyPolicyInitial value)?  initial,TResult? Function( PrivacyPolicyLoading value)?  loading,TResult? Function( PrivacyPolicySuccess value)?  success,TResult? Function( PrivacyPolicyFailure value)?  failure,}){
final _that = this;
switch (_that) {
case PrivacyPolicyInitial() when initial != null:
return initial(_that);case PrivacyPolicyLoading() when loading != null:
return loading(_that);case PrivacyPolicySuccess() when success != null:
return success(_that);case PrivacyPolicyFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PrivacyPolicyModel policy,  CompanyInfoModel companyInfo)?  success,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PrivacyPolicyInitial() when initial != null:
return initial();case PrivacyPolicyLoading() when loading != null:
return loading();case PrivacyPolicySuccess() when success != null:
return success(_that.policy,_that.companyInfo);case PrivacyPolicyFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PrivacyPolicyModel policy,  CompanyInfoModel companyInfo)  success,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case PrivacyPolicyInitial():
return initial();case PrivacyPolicyLoading():
return loading();case PrivacyPolicySuccess():
return success(_that.policy,_that.companyInfo);case PrivacyPolicyFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PrivacyPolicyModel policy,  CompanyInfoModel companyInfo)?  success,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case PrivacyPolicyInitial() when initial != null:
return initial();case PrivacyPolicyLoading() when loading != null:
return loading();case PrivacyPolicySuccess() when success != null:
return success(_that.policy,_that.companyInfo);case PrivacyPolicyFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class PrivacyPolicyInitial implements PrivacyPolicyState {
  const PrivacyPolicyInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacyPolicyInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrivacyPolicyState.initial()';
}


}




/// @nodoc


class PrivacyPolicyLoading implements PrivacyPolicyState {
  const PrivacyPolicyLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacyPolicyLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrivacyPolicyState.loading()';
}


}




/// @nodoc


class PrivacyPolicySuccess implements PrivacyPolicyState {
  const PrivacyPolicySuccess({required this.policy, required this.companyInfo});
  

 final  PrivacyPolicyModel policy;
 final  CompanyInfoModel companyInfo;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacyPolicySuccess&&(identical(other.policy, policy) || other.policy == policy)&&(identical(other.companyInfo, companyInfo) || other.companyInfo == companyInfo));
}


@override
int get hashCode => Object.hash(runtimeType,policy,companyInfo);

@override
String toString() {
  return 'PrivacyPolicyState.success(policy: $policy, companyInfo: $companyInfo)';
}


}




/// @nodoc


class PrivacyPolicyFailure implements PrivacyPolicyState {
  const PrivacyPolicyFailure(this.error);
  

 final  String error;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacyPolicyFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PrivacyPolicyState.failure(error: $error)';
}


}




// dart format on
