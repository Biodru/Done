// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BottomBarState {
  int get pageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomBarStateCopyWith<BottomBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomBarStateCopyWith<$Res> {
  factory $BottomBarStateCopyWith(
          BottomBarState value, $Res Function(BottomBarState) then) =
      _$BottomBarStateCopyWithImpl<$Res, BottomBarState>;
  @useResult
  $Res call({int pageIndex});
}

/// @nodoc
class _$BottomBarStateCopyWithImpl<$Res, $Val extends BottomBarState>
    implements $BottomBarStateCopyWith<$Res> {
  _$BottomBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
  }) {
    return _then(_value.copyWith(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BottomBarStateImplCopyWith<$Res>
    implements $BottomBarStateCopyWith<$Res> {
  factory _$$BottomBarStateImplCopyWith(_$BottomBarStateImpl value,
          $Res Function(_$BottomBarStateImpl) then) =
      __$$BottomBarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pageIndex});
}

/// @nodoc
class __$$BottomBarStateImplCopyWithImpl<$Res>
    extends _$BottomBarStateCopyWithImpl<$Res, _$BottomBarStateImpl>
    implements _$$BottomBarStateImplCopyWith<$Res> {
  __$$BottomBarStateImplCopyWithImpl(
      _$BottomBarStateImpl _value, $Res Function(_$BottomBarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageIndex = null,
  }) {
    return _then(_$BottomBarStateImpl(
      pageIndex: null == pageIndex
          ? _value.pageIndex
          : pageIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BottomBarStateImpl extends _BottomBarState {
  const _$BottomBarStateImpl({this.pageIndex = 0}) : super._();

  @override
  @JsonKey()
  final int pageIndex;

  @override
  String toString() {
    return 'BottomBarState(pageIndex: $pageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomBarStateImpl &&
            (identical(other.pageIndex, pageIndex) ||
                other.pageIndex == pageIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomBarStateImplCopyWith<_$BottomBarStateImpl> get copyWith =>
      __$$BottomBarStateImplCopyWithImpl<_$BottomBarStateImpl>(
          this, _$identity);
}

abstract class _BottomBarState extends BottomBarState {
  const factory _BottomBarState({final int pageIndex}) = _$BottomBarStateImpl;
  const _BottomBarState._() : super._();

  @override
  int get pageIndex;
  @override
  @JsonKey(ignore: true)
  _$$BottomBarStateImplCopyWith<_$BottomBarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
