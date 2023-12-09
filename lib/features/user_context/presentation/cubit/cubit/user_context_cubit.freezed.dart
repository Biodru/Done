// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_context_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserContextState {
  int? get currentContextId => throw _privateConstructorUsedError;
  List<UserContext> get contextList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserContextStateCopyWith<UserContextState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserContextStateCopyWith<$Res> {
  factory $UserContextStateCopyWith(
          UserContextState value, $Res Function(UserContextState) then) =
      _$UserContextStateCopyWithImpl<$Res, UserContextState>;
  @useResult
  $Res call(
      {int? currentContextId, List<UserContext> contextList, bool isLoading});
}

/// @nodoc
class _$UserContextStateCopyWithImpl<$Res, $Val extends UserContextState>
    implements $UserContextStateCopyWith<$Res> {
  _$UserContextStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentContextId = freezed,
    Object? contextList = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      currentContextId: freezed == currentContextId
          ? _value.currentContextId
          : currentContextId // ignore: cast_nullable_to_non_nullable
              as int?,
      contextList: null == contextList
          ? _value.contextList
          : contextList // ignore: cast_nullable_to_non_nullable
              as List<UserContext>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserContextStateImplCopyWith<$Res>
    implements $UserContextStateCopyWith<$Res> {
  factory _$$UserContextStateImplCopyWith(_$UserContextStateImpl value,
          $Res Function(_$UserContextStateImpl) then) =
      __$$UserContextStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? currentContextId, List<UserContext> contextList, bool isLoading});
}

/// @nodoc
class __$$UserContextStateImplCopyWithImpl<$Res>
    extends _$UserContextStateCopyWithImpl<$Res, _$UserContextStateImpl>
    implements _$$UserContextStateImplCopyWith<$Res> {
  __$$UserContextStateImplCopyWithImpl(_$UserContextStateImpl _value,
      $Res Function(_$UserContextStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentContextId = freezed,
    Object? contextList = null,
    Object? isLoading = null,
  }) {
    return _then(_$UserContextStateImpl(
      currentContextId: freezed == currentContextId
          ? _value.currentContextId
          : currentContextId // ignore: cast_nullable_to_non_nullable
              as int?,
      contextList: null == contextList
          ? _value._contextList
          : contextList // ignore: cast_nullable_to_non_nullable
              as List<UserContext>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserContextStateImpl extends _UserContextState {
  const _$UserContextStateImpl(
      {this.currentContextId = null,
      final List<UserContext> contextList = const [],
      this.isLoading = true})
      : _contextList = contextList,
        super._();

  @override
  @JsonKey()
  final int? currentContextId;
  final List<UserContext> _contextList;
  @override
  @JsonKey()
  List<UserContext> get contextList {
    if (_contextList is EqualUnmodifiableListView) return _contextList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contextList);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'UserContextState(currentContextId: $currentContextId, contextList: $contextList, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserContextStateImpl &&
            (identical(other.currentContextId, currentContextId) ||
                other.currentContextId == currentContextId) &&
            const DeepCollectionEquality()
                .equals(other._contextList, _contextList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentContextId,
      const DeepCollectionEquality().hash(_contextList), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserContextStateImplCopyWith<_$UserContextStateImpl> get copyWith =>
      __$$UserContextStateImplCopyWithImpl<_$UserContextStateImpl>(
          this, _$identity);
}

abstract class _UserContextState extends UserContextState {
  const factory _UserContextState(
      {final int? currentContextId,
      final List<UserContext> contextList,
      final bool isLoading}) = _$UserContextStateImpl;
  const _UserContextState._() : super._();

  @override
  int? get currentContextId;
  @override
  List<UserContext> get contextList;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$UserContextStateImplCopyWith<_$UserContextStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
