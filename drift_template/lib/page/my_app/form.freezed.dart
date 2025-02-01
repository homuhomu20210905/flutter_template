// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyAppForm {
  String get id => throw _privateConstructorUsedError;

  /// Create a copy of MyAppForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyAppFormCopyWith<MyAppForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAppFormCopyWith<$Res> {
  factory $MyAppFormCopyWith(MyAppForm value, $Res Function(MyAppForm) then) =
      _$MyAppFormCopyWithImpl<$Res, MyAppForm>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$MyAppFormCopyWithImpl<$Res, $Val extends MyAppForm>
    implements $MyAppFormCopyWith<$Res> {
  _$MyAppFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyAppForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyAppFormImplCopyWith<$Res>
    implements $MyAppFormCopyWith<$Res> {
  factory _$$MyAppFormImplCopyWith(
          _$MyAppFormImpl value, $Res Function(_$MyAppFormImpl) then) =
      __$$MyAppFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$MyAppFormImplCopyWithImpl<$Res>
    extends _$MyAppFormCopyWithImpl<$Res, _$MyAppFormImpl>
    implements _$$MyAppFormImplCopyWith<$Res> {
  __$$MyAppFormImplCopyWithImpl(
      _$MyAppFormImpl _value, $Res Function(_$MyAppFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyAppForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$MyAppFormImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MyAppFormImpl implements _MyAppForm {
  const _$MyAppFormImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'MyAppForm(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyAppFormImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of MyAppForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyAppFormImplCopyWith<_$MyAppFormImpl> get copyWith =>
      __$$MyAppFormImplCopyWithImpl<_$MyAppFormImpl>(this, _$identity);
}

abstract class _MyAppForm implements MyAppForm {
  const factory _MyAppForm({required final String id}) = _$MyAppFormImpl;

  @override
  String get id;

  /// Create a copy of MyAppForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyAppFormImplCopyWith<_$MyAppFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
