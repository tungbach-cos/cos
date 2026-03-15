// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnitRequestModel {

 String? get name; DateTime? get updatedAt;
/// Create a copy of UnitRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitRequestModelCopyWith<UnitRequestModel> get copyWith => _$UnitRequestModelCopyWithImpl<UnitRequestModel>(this as UnitRequestModel, _$identity);

  /// Serializes this UnitRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,updatedAt);

@override
String toString() {
  return 'UnitRequestModel(name: $name, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $UnitRequestModelCopyWith<$Res>  {
  factory $UnitRequestModelCopyWith(UnitRequestModel value, $Res Function(UnitRequestModel) _then) = _$UnitRequestModelCopyWithImpl;
@useResult
$Res call({
 String? name, DateTime? updatedAt
});




}
/// @nodoc
class _$UnitRequestModelCopyWithImpl<$Res>
    implements $UnitRequestModelCopyWith<$Res> {
  _$UnitRequestModelCopyWithImpl(this._self, this._then);

  final UnitRequestModel _self;
  final $Res Function(UnitRequestModel) _then;

/// Create a copy of UnitRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UnitRequestModel].
extension UnitRequestModelPatterns on UnitRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnitRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnitRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnitRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _UnitRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnitRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _UnitRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitRequestModel() when $default != null:
return $default(_that.name,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _UnitRequestModel():
return $default(_that.name,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _UnitRequestModel() when $default != null:
return $default(_that.name,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnitRequestModel implements UnitRequestModel {
  const _UnitRequestModel({this.name, this.updatedAt});
  factory _UnitRequestModel.fromJson(Map<String, dynamic> json) => _$UnitRequestModelFromJson(json);

@override final  String? name;
@override final  DateTime? updatedAt;

/// Create a copy of UnitRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnitRequestModelCopyWith<_UnitRequestModel> get copyWith => __$UnitRequestModelCopyWithImpl<_UnitRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnitRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitRequestModel&&(identical(other.name, name) || other.name == name)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,updatedAt);

@override
String toString() {
  return 'UnitRequestModel(name: $name, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$UnitRequestModelCopyWith<$Res> implements $UnitRequestModelCopyWith<$Res> {
  factory _$UnitRequestModelCopyWith(_UnitRequestModel value, $Res Function(_UnitRequestModel) _then) = __$UnitRequestModelCopyWithImpl;
@override @useResult
$Res call({
 String? name, DateTime? updatedAt
});




}
/// @nodoc
class __$UnitRequestModelCopyWithImpl<$Res>
    implements _$UnitRequestModelCopyWith<$Res> {
  __$UnitRequestModelCopyWithImpl(this._self, this._then);

  final _UnitRequestModel _self;
  final $Res Function(_UnitRequestModel) _then;

/// Create a copy of UnitRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? updatedAt = freezed,}) {
  return _then(_UnitRequestModel(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
