// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileRequestModel {

 List<int> get bytes; String get contentType; String get name;
/// Create a copy of FileRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileRequestModelCopyWith<FileRequestModel> get copyWith => _$FileRequestModelCopyWithImpl<FileRequestModel>(this as FileRequestModel, _$identity);

  /// Serializes this FileRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileRequestModel&&const DeepCollectionEquality().equals(other.bytes, bytes)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bytes),contentType,name);

@override
String toString() {
  return 'FileRequestModel(bytes: $bytes, contentType: $contentType, name: $name)';
}


}

/// @nodoc
abstract mixin class $FileRequestModelCopyWith<$Res>  {
  factory $FileRequestModelCopyWith(FileRequestModel value, $Res Function(FileRequestModel) _then) = _$FileRequestModelCopyWithImpl;
@useResult
$Res call({
 List<int> bytes, String contentType, String name
});




}
/// @nodoc
class _$FileRequestModelCopyWithImpl<$Res>
    implements $FileRequestModelCopyWith<$Res> {
  _$FileRequestModelCopyWithImpl(this._self, this._then);

  final FileRequestModel _self;
  final $Res Function(FileRequestModel) _then;

/// Create a copy of FileRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bytes = null,Object? contentType = null,Object? name = null,}) {
  return _then(_self.copyWith(
bytes: null == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as List<int>,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FileRequestModel].
extension FileRequestModelPatterns on FileRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _FileRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _FileRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> bytes,  String contentType,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileRequestModel() when $default != null:
return $default(_that.bytes,_that.contentType,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> bytes,  String contentType,  String name)  $default,) {final _that = this;
switch (_that) {
case _FileRequestModel():
return $default(_that.bytes,_that.contentType,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> bytes,  String contentType,  String name)?  $default,) {final _that = this;
switch (_that) {
case _FileRequestModel() when $default != null:
return $default(_that.bytes,_that.contentType,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FileRequestModel implements FileRequestModel {
  const _FileRequestModel({required final  List<int> bytes, required this.contentType, required this.name}): _bytes = bytes;
  factory _FileRequestModel.fromJson(Map<String, dynamic> json) => _$FileRequestModelFromJson(json);

 final  List<int> _bytes;
@override List<int> get bytes {
  if (_bytes is EqualUnmodifiableListView) return _bytes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bytes);
}

@override final  String contentType;
@override final  String name;

/// Create a copy of FileRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileRequestModelCopyWith<_FileRequestModel> get copyWith => __$FileRequestModelCopyWithImpl<_FileRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileRequestModel&&const DeepCollectionEquality().equals(other._bytes, _bytes)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bytes),contentType,name);

@override
String toString() {
  return 'FileRequestModel(bytes: $bytes, contentType: $contentType, name: $name)';
}


}

/// @nodoc
abstract mixin class _$FileRequestModelCopyWith<$Res> implements $FileRequestModelCopyWith<$Res> {
  factory _$FileRequestModelCopyWith(_FileRequestModel value, $Res Function(_FileRequestModel) _then) = __$FileRequestModelCopyWithImpl;
@override @useResult
$Res call({
 List<int> bytes, String contentType, String name
});




}
/// @nodoc
class __$FileRequestModelCopyWithImpl<$Res>
    implements _$FileRequestModelCopyWith<$Res> {
  __$FileRequestModelCopyWithImpl(this._self, this._then);

  final _FileRequestModel _self;
  final $Res Function(_FileRequestModel) _then;

/// Create a copy of FileRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bytes = null,Object? contentType = null,Object? name = null,}) {
  return _then(_FileRequestModel(
bytes: null == bytes ? _self._bytes : bytes // ignore: cast_nullable_to_non_nullable
as List<int>,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
