// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_policy_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PolicySectionModel {

 String get title; String get content;
/// Create a copy of PolicySectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PolicySectionModelCopyWith<PolicySectionModel> get copyWith => _$PolicySectionModelCopyWithImpl<PolicySectionModel>(this as PolicySectionModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PolicySectionModel&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,title,content);

@override
String toString() {
  return 'PolicySectionModel(title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class $PolicySectionModelCopyWith<$Res>  {
  factory $PolicySectionModelCopyWith(PolicySectionModel value, $Res Function(PolicySectionModel) _then) = _$PolicySectionModelCopyWithImpl;
@useResult
$Res call({
 String title, String content
});




}
/// @nodoc
class _$PolicySectionModelCopyWithImpl<$Res>
    implements $PolicySectionModelCopyWith<$Res> {
  _$PolicySectionModelCopyWithImpl(this._self, this._then);

  final PolicySectionModel _self;
  final $Res Function(PolicySectionModel) _then;

/// Create a copy of PolicySectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? content = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PolicySectionModel].
extension PolicySectionModelPatterns on PolicySectionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PolicySectionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PolicySectionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PolicySectionModel value)  $default,){
final _that = this;
switch (_that) {
case _PolicySectionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PolicySectionModel value)?  $default,){
final _that = this;
switch (_that) {
case _PolicySectionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PolicySectionModel() when $default != null:
return $default(_that.title,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String content)  $default,) {final _that = this;
switch (_that) {
case _PolicySectionModel():
return $default(_that.title,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String content)?  $default,) {final _that = this;
switch (_that) {
case _PolicySectionModel() when $default != null:
return $default(_that.title,_that.content);case _:
  return null;

}
}

}

/// @nodoc


class _PolicySectionModel implements PolicySectionModel {
  const _PolicySectionModel({required this.title, required this.content});
  

@override final  String title;
@override final  String content;

/// Create a copy of PolicySectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PolicySectionModelCopyWith<_PolicySectionModel> get copyWith => __$PolicySectionModelCopyWithImpl<_PolicySectionModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PolicySectionModel&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,title,content);

@override
String toString() {
  return 'PolicySectionModel(title: $title, content: $content)';
}


}

/// @nodoc
abstract mixin class _$PolicySectionModelCopyWith<$Res> implements $PolicySectionModelCopyWith<$Res> {
  factory _$PolicySectionModelCopyWith(_PolicySectionModel value, $Res Function(_PolicySectionModel) _then) = __$PolicySectionModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String content
});




}
/// @nodoc
class __$PolicySectionModelCopyWithImpl<$Res>
    implements _$PolicySectionModelCopyWith<$Res> {
  __$PolicySectionModelCopyWithImpl(this._self, this._then);

  final _PolicySectionModel _self;
  final $Res Function(_PolicySectionModel) _then;

/// Create a copy of PolicySectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? content = null,}) {
  return _then(_PolicySectionModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PrivacyPolicyModel {

 String get pageTitle; DateTime get lastUpdated; List<PolicySectionModel> get sections;
/// Create a copy of PrivacyPolicyModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivacyPolicyModelCopyWith<PrivacyPolicyModel> get copyWith => _$PrivacyPolicyModelCopyWithImpl<PrivacyPolicyModel>(this as PrivacyPolicyModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacyPolicyModel&&(identical(other.pageTitle, pageTitle) || other.pageTitle == pageTitle)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other.sections, sections));
}


@override
int get hashCode => Object.hash(runtimeType,pageTitle,lastUpdated,const DeepCollectionEquality().hash(sections));

@override
String toString() {
  return 'PrivacyPolicyModel(pageTitle: $pageTitle, lastUpdated: $lastUpdated, sections: $sections)';
}


}

/// @nodoc
abstract mixin class $PrivacyPolicyModelCopyWith<$Res>  {
  factory $PrivacyPolicyModelCopyWith(PrivacyPolicyModel value, $Res Function(PrivacyPolicyModel) _then) = _$PrivacyPolicyModelCopyWithImpl;
@useResult
$Res call({
 String pageTitle, DateTime lastUpdated, List<PolicySectionModel> sections
});




}
/// @nodoc
class _$PrivacyPolicyModelCopyWithImpl<$Res>
    implements $PrivacyPolicyModelCopyWith<$Res> {
  _$PrivacyPolicyModelCopyWithImpl(this._self, this._then);

  final PrivacyPolicyModel _self;
  final $Res Function(PrivacyPolicyModel) _then;

/// Create a copy of PrivacyPolicyModel
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


/// Adds pattern-matching-related methods to [PrivacyPolicyModel].
extension PrivacyPolicyModelPatterns on PrivacyPolicyModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrivacyPolicyModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrivacyPolicyModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrivacyPolicyModel value)  $default,){
final _that = this;
switch (_that) {
case _PrivacyPolicyModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrivacyPolicyModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrivacyPolicyModel() when $default != null:
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
case _PrivacyPolicyModel() when $default != null:
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
case _PrivacyPolicyModel():
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
case _PrivacyPolicyModel() when $default != null:
return $default(_that.pageTitle,_that.lastUpdated,_that.sections);case _:
  return null;

}
}

}

/// @nodoc


class _PrivacyPolicyModel implements PrivacyPolicyModel {
  const _PrivacyPolicyModel({required this.pageTitle, required this.lastUpdated, required final  List<PolicySectionModel> sections}): _sections = sections;
  

@override final  String pageTitle;
@override final  DateTime lastUpdated;
 final  List<PolicySectionModel> _sections;
@override List<PolicySectionModel> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}


/// Create a copy of PrivacyPolicyModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivacyPolicyModelCopyWith<_PrivacyPolicyModel> get copyWith => __$PrivacyPolicyModelCopyWithImpl<_PrivacyPolicyModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivacyPolicyModel&&(identical(other.pageTitle, pageTitle) || other.pageTitle == pageTitle)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated)&&const DeepCollectionEquality().equals(other._sections, _sections));
}


@override
int get hashCode => Object.hash(runtimeType,pageTitle,lastUpdated,const DeepCollectionEquality().hash(_sections));

@override
String toString() {
  return 'PrivacyPolicyModel(pageTitle: $pageTitle, lastUpdated: $lastUpdated, sections: $sections)';
}


}

/// @nodoc
abstract mixin class _$PrivacyPolicyModelCopyWith<$Res> implements $PrivacyPolicyModelCopyWith<$Res> {
  factory _$PrivacyPolicyModelCopyWith(_PrivacyPolicyModel value, $Res Function(_PrivacyPolicyModel) _then) = __$PrivacyPolicyModelCopyWithImpl;
@override @useResult
$Res call({
 String pageTitle, DateTime lastUpdated, List<PolicySectionModel> sections
});




}
/// @nodoc
class __$PrivacyPolicyModelCopyWithImpl<$Res>
    implements _$PrivacyPolicyModelCopyWith<$Res> {
  __$PrivacyPolicyModelCopyWithImpl(this._self, this._then);

  final _PrivacyPolicyModel _self;
  final $Res Function(_PrivacyPolicyModel) _then;

/// Create a copy of PrivacyPolicyModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageTitle = null,Object? lastUpdated = null,Object? sections = null,}) {
  return _then(_PrivacyPolicyModel(
pageTitle: null == pageTitle ? _self.pageTitle : pageTitle // ignore: cast_nullable_to_non_nullable
as String,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as DateTime,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<PolicySectionModel>,
  ));
}


}

// dart format on
