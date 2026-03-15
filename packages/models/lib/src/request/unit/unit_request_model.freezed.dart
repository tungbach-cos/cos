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

@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? get id; String? get name;
/// Create a copy of UnitRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnitRequestModelCopyWith<UnitRequestModel> get copyWith => _$UnitRequestModelCopyWithImpl<UnitRequestModel>(this as UnitRequestModel, _$identity);

  /// Serializes this UnitRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnitRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'UnitRequestModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $UnitRequestModelCopyWith<$Res>  {
  factory $UnitRequestModelCopyWith(UnitRequestModel value, $Res Function(UnitRequestModel) _then) = _$UnitRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? id, String? name
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: ParsingHelper.nullableIntFromJson)  int? id,  String? name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnitRequestModel() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: ParsingHelper.nullableIntFromJson)  int? id,  String? name)  $default,) {final _that = this;
switch (_that) {
case _UnitRequestModel():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: ParsingHelper.nullableIntFromJson)  int? id,  String? name)?  $default,) {final _that = this;
switch (_that) {
case _UnitRequestModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnitRequestModel implements UnitRequestModel {
  const _UnitRequestModel({@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) this.id, this.name});
  factory _UnitRequestModel.fromJson(Map<String, dynamic> json) => _$UnitRequestModelFromJson(json);

@override@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) final  int? id;
@override final  String? name;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnitRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'UnitRequestModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$UnitRequestModelCopyWith<$Res> implements $UnitRequestModelCopyWith<$Res> {
  factory _$UnitRequestModelCopyWith(_UnitRequestModel value, $Res Function(_UnitRequestModel) _then) = __$UnitRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? id, String? name
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_UnitRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
