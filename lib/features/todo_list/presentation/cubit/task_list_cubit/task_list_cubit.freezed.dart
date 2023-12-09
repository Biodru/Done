// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskListState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Task> get items => throw _privateConstructorUsedError;
  int get dateFilterCounter => throw _privateConstructorUsedError;
  int get priorityFilterCounter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskListStateCopyWith<TaskListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListStateCopyWith<$Res> {
  factory $TaskListStateCopyWith(
          TaskListState value, $Res Function(TaskListState) then) =
      _$TaskListStateCopyWithImpl<$Res, TaskListState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<Task> items,
      int dateFilterCounter,
      int priorityFilterCounter});
}

/// @nodoc
class _$TaskListStateCopyWithImpl<$Res, $Val extends TaskListState>
    implements $TaskListStateCopyWith<$Res> {
  _$TaskListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? items = null,
    Object? dateFilterCounter = null,
    Object? priorityFilterCounter = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      dateFilterCounter: null == dateFilterCounter
          ? _value.dateFilterCounter
          : dateFilterCounter // ignore: cast_nullable_to_non_nullable
              as int,
      priorityFilterCounter: null == priorityFilterCounter
          ? _value.priorityFilterCounter
          : priorityFilterCounter // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskListStateImplCopyWith<$Res>
    implements $TaskListStateCopyWith<$Res> {
  factory _$$TaskListStateImplCopyWith(
          _$TaskListStateImpl value, $Res Function(_$TaskListStateImpl) then) =
      __$$TaskListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<Task> items,
      int dateFilterCounter,
      int priorityFilterCounter});
}

/// @nodoc
class __$$TaskListStateImplCopyWithImpl<$Res>
    extends _$TaskListStateCopyWithImpl<$Res, _$TaskListStateImpl>
    implements _$$TaskListStateImplCopyWith<$Res> {
  __$$TaskListStateImplCopyWithImpl(
      _$TaskListStateImpl _value, $Res Function(_$TaskListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? items = null,
    Object? dateFilterCounter = null,
    Object? priorityFilterCounter = null,
  }) {
    return _then(_$TaskListStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      dateFilterCounter: null == dateFilterCounter
          ? _value.dateFilterCounter
          : dateFilterCounter // ignore: cast_nullable_to_non_nullable
              as int,
      priorityFilterCounter: null == priorityFilterCounter
          ? _value.priorityFilterCounter
          : priorityFilterCounter // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TaskListStateImpl extends _TaskListState {
  const _$TaskListStateImpl(
      {this.isLoading = true,
      final List<Task> items = const [],
      this.dateFilterCounter = 0,
      this.priorityFilterCounter = 0})
      : _items = items,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<Task> _items;
  @override
  @JsonKey()
  List<Task> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int dateFilterCounter;
  @override
  @JsonKey()
  final int priorityFilterCounter;

  @override
  String toString() {
    return 'TaskListState(isLoading: $isLoading, items: $items, dateFilterCounter: $dateFilterCounter, priorityFilterCounter: $priorityFilterCounter)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.dateFilterCounter, dateFilterCounter) ||
                other.dateFilterCounter == dateFilterCounter) &&
            (identical(other.priorityFilterCounter, priorityFilterCounter) ||
                other.priorityFilterCounter == priorityFilterCounter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_items),
      dateFilterCounter,
      priorityFilterCounter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskListStateImplCopyWith<_$TaskListStateImpl> get copyWith =>
      __$$TaskListStateImplCopyWithImpl<_$TaskListStateImpl>(this, _$identity);
}

abstract class _TaskListState extends TaskListState {
  const factory _TaskListState(
      {final bool isLoading,
      final List<Task> items,
      final int dateFilterCounter,
      final int priorityFilterCounter}) = _$TaskListStateImpl;
  const _TaskListState._() : super._();

  @override
  bool get isLoading;
  @override
  List<Task> get items;
  @override
  int get dateFilterCounter;
  @override
  int get priorityFilterCounter;
  @override
  @JsonKey(ignore: true)
  _$$TaskListStateImplCopyWith<_$TaskListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
