// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_of_service_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TermsOfServiceModel {

 String get pageTitle; DateTime get lastUpdated; List<PolicySectionModel> get sections;
/// Create a copy of TermsOfServiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermsOfServiceModelCopyWith<TermsOfServiceModel> get copyWith => _$TermsOfServiceModelCopyWithImpl<TermsOfServiceModel>(this as TermsOfServiceModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsOfServiceModel&&(identical(other.pageTitle, pageTitle) || other.pageTitle == pageTitle)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other.sections, sections));
}


@override
int get hashCode => Object.hash(runtimeType,pageTitle,lastUpdated,const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'TermsOfServiceModel(pageTitle: $pageTitle, lastUpdated: $lastUpdated, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $TermsOfServiceModelCopyWith<$Res>  {
  factory $TermsOfServiceModelCopyWith(TermsOfServiceModel value, $Res Function(TermsOfServiceModel) _then) = _$TermsOfServiceModelCopyWithImpl;
@useResult
$Res call({
 String pageTitle, DateTime lastUpdated, List<PolicySectionModel> sections
});




}
/// @nodoc
class _$TermsOfServiceModelCopyWithImpl<$Res>
    implements $TermsOfServiceModelCopyWith<$Res> {
  _$TermsOfServiceModelCopyWithImpl(this._self, this._then);

  final TermsOfServiceModel _self;
  final $Res Function(TermsOfServiceModel) _then;

/// Create a copy of TermsOfServiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageTitle = null,Object? lastUpdated = null,Object? sections = null,}) {
  return _then(_self.copyWith(
pageTitle: null == pageTitle ? _self.pageTitle : pageTitle // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<PolicySectionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TermsOfServiceModel].
extension TermsOfServiceModelPatterns on TermsOfServiceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TermsOfServiceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TermsOfServiceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TermsOfServiceModel value)  $default,){
final _that = this;
switch (_that) {
case _TermsOfServiceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TermsOfServiceModel value)?  $default,){
final _that = this;
switch (_that) {
case _TermsOfServiceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String pageTitle,  DateTime lastUpdated,  List<PolicySectionModel> sections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TermsOfServiceModel() when $default != null:
return $default(_that.pageTitle,_that.lastUpdated,_that.sections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String pageTitle,  DateTime lastUpdated,  List<PolicySectionModel> sections)  $default,) {final _that = this;
switch (_that) {
case _TermsOfServiceModel():
return $default(_that.pageTitle,_that.lastUpdated,_that.sections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String pageTitle,  DateTime lastUpdated,  List<PolicySectionModel> sections)?  $default,) {final _that = this;
switch (_that) {
case _TermsOfServiceModel() when $default != null:
return $default(_that.pageTitle,_that.lastUpdated,_that.sections);case _:
  return null;

}
}

}

/// @nodoc


class _TermsOfServiceModel implements TermsOfServiceModel {
  const _TermsOfServiceModel({required this.pageTitle, required this.lastUpdated, required final  List<PolicySectionModel> sections}): _sections = sections;
  

@override final  String pageTitle;
@override final  DateTime lastUpdated;
 final  List<PolicySectionModel> _sections;
@override List<PolicySectionModel> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of TermsOfServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TermsOfServiceModelCopyWith<_TermsOfServiceModel> get copyWith => __$TermsOfServiceModelCopyWithImpl<_TermsOfServiceModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TermsOfServiceModel&&(identical(other.pageTitle, pageTitle) || other.pageTitle == pageTitle)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other._sections, _sections));
}


@override
int get hashCode => Object.hash(runtimeType,pageTitle,lastUpdated,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'TermsOfServiceModel(pageTitle: $pageTitle, lastUpdated: $lastUpdated, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$TermsOfServiceModelCopyWith<$Res> implements $TermsOfServiceModelCopyWith<$Res> {
  factory _$TermsOfServiceModelCopyWith(_TermsOfServiceModel value, $Res Function(_TermsOfServiceModel) _then) = __$TermsOfServiceModelCopyWithImpl;
@override @useResult
$Res call({
 String pageTitle, DateTime lastUpdated, List<PolicySectionModel> sections
});




}
/// @nodoc
class __$TermsOfServiceModelCopyWithImpl<$Res>
    implements _$TermsOfServiceModelCopyWith<$Res> {
  __$TermsOfServiceModelCopyWithImpl(this._self, this._then);

  final _TermsOfServiceModel _self;
  final $Res Function(_TermsOfServiceModel) _then;

/// Create a copy of TermsOfServiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageTitle = null,Object? lastUpdated = null,Object? sections = null,}) {
  return _then(_TermsOfServiceModel(
pageTitle: null == pageTitle ? _self.pageTitle : pageTitle // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<PolicySectionModel>,
  ));
}


}

// dart format on
