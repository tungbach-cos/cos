// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_info_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompanyInfoState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyInfoState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyInfoState()';
}


}




/// Adds pattern-matching-related methods to [CompanyInfoState].
extension CompanyInfoStatePatterns on CompanyInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CompanyInfoInitial value)?  initial,TResult Function( CompanyInfoLoading value)?  loading,TResult Function( CompanyInfoSuccess value)?  success,TResult Function( CompanyInfoFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CompanyInfoInitial() when initial != null:
return initial(_that);case CompanyInfoLoading() when loading != null:
return loading(_that);case CompanyInfoSuccess() when success != null:
return success(_that);case CompanyInfoFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CompanyInfoInitial value)  initial,required TResult Function( CompanyInfoLoading value)  loading,required TResult Function( CompanyInfoSuccess value)  success,required TResult Function( CompanyInfoFailure value)  failure,}){
final _that = this;
switch (_that) {
case CompanyInfoInitial():
return initial(_that);case CompanyInfoLoading():
return loading(_that);case CompanyInfoSuccess():
return success(_that);case CompanyInfoFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CompanyInfoInitial value)?  initial,TResult? Function( CompanyInfoLoading value)?  loading,TResult? Function( CompanyInfoSuccess value)?  success,TResult? Function( CompanyInfoFailure value)?  failure,}){
final _that = this;
switch (_that) {
case CompanyInfoInitial() when initial != null:
return initial(_that);case CompanyInfoLoading() when loading != null:
return loading(_that);case CompanyInfoSuccess() when success != null:
return success(_that);case CompanyInfoFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CompanyInfoModel companyInfo)?  success,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CompanyInfoInitial() when initial != null:
return initial();case CompanyInfoLoading() when loading != null:
return loading();case CompanyInfoSuccess() when success != null:
return success(_that.companyInfo);case CompanyInfoFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CompanyInfoModel companyInfo)  success,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case CompanyInfoInitial():
return initial();case CompanyInfoLoading():
return loading();case CompanyInfoSuccess():
return success(_that.companyInfo);case CompanyInfoFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CompanyInfoModel companyInfo)?  success,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case CompanyInfoInitial() when initial != null:
return initial();case CompanyInfoLoading() when loading != null:
return loading();case CompanyInfoSuccess() when success != null:
return success(_that.companyInfo);case CompanyInfoFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class CompanyInfoInitial implements CompanyInfoState {
  const CompanyInfoInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyInfoInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyInfoState.initial()';
}


}




/// @nodoc


class CompanyInfoLoading implements CompanyInfoState {
  const CompanyInfoLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyInfoLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompanyInfoState.loading()';
}


}




/// @nodoc


class CompanyInfoSuccess implements CompanyInfoState {
  const CompanyInfoSuccess(this.companyInfo);
  

 final  CompanyInfoModel companyInfo;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyInfoSuccess&&(identical(other.companyInfo, companyInfo) || other.companyInfo == companyInfo));
}


@override
int get hashCode => Object.hash(runtimeType,companyInfo);

@override
String toString() {
  return 'CompanyInfoState.success(companyInfo: $companyInfo)';
}


}




/// @nodoc


class CompanyInfoFailure implements CompanyInfoState {
  const CompanyInfoFailure(this.error);
  

 final  String error;




@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompanyInfoFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CompanyInfoState.failure(error: $error)';
}


}




// dart format on
