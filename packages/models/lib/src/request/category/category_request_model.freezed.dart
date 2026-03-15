// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryRequestModel {

@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? get id; String? get name;
/// Create a copy of CategoryRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryRequestModelCopyWith<CategoryRequestModel> get copyWith => _$CategoryRequestModelCopyWithImpl<CategoryRequestModel>(this as CategoryRequestModel, _$identity);

  /// Serializes this CategoryRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'CategoryRequestModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $CategoryRequestModelCopyWith<$Res>  {
  factory $CategoryRequestModelCopyWith(CategoryRequestModel value, $Res Function(CategoryRequestModel) _then) = _$CategoryRequestModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? id, String? name
});




}
/// @nodoc
class _$CategoryRequestModelCopyWithImpl<$Res>
    implements $CategoryRequestModelCopyWith<$Res> {
  _$CategoryRequestModelCopyWithImpl(this._self, this._then);

  final CategoryRequestModel _self;
  final $Res Function(CategoryRequestModel) _then;

/// Create a copy of CategoryRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryRequestModel].
extension CategoryRequestModelPatterns on CategoryRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryRequestModel() when $default != null:
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
case _CategoryRequestModel() when $default != null:
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
case _CategoryRequestModel():
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
case _CategoryRequestModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryRequestModel implements CategoryRequestModel {
  const _CategoryRequestModel({@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) this.id, this.name});
  factory _CategoryRequestModel.fromJson(Map<String, dynamic> json) => _$CategoryRequestModelFromJson(json);

@override@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) final  int? id;
@override final  String? name;

/// Create a copy of CategoryRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryRequestModelCopyWith<_CategoryRequestModel> get copyWith => __$CategoryRequestModelCopyWithImpl<_CategoryRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'CategoryRequestModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$CategoryRequestModelCopyWith<$Res> implements $CategoryRequestModelCopyWith<$Res> {
  factory _$CategoryRequestModelCopyWith(_CategoryRequestModel value, $Res Function(_CategoryRequestModel) _then) = __$CategoryRequestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: ParsingHelper.nullableIntFromJson) int? id, String? name
});




}
/// @nodoc
class __$CategoryRequestModelCopyWithImpl<$Res>
    implements _$CategoryRequestModelCopyWith<$Res> {
  __$CategoryRequestModelCopyWithImpl(this._self, this._then);

  final _CategoryRequestModel _self;
  final $Res Function(_CategoryRequestModel) _then;

/// Create a copy of CategoryRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,}) {
  return _then(_CategoryRequestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
