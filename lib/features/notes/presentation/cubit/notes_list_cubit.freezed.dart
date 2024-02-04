// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotesListState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Note> get notes => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, List<Note> notes) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<Note> notes)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<Note> notes)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotesListState value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotesListState value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotesListState value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotesListStateCopyWith<NotesListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesListStateCopyWith<$Res> {
  factory $NotesListStateCopyWith(
          NotesListState value, $Res Function(NotesListState) then) =
      _$NotesListStateCopyWithImpl<$Res, NotesListState>;
  @useResult
  $Res call({bool isLoading, List<Note> notes});
}

/// @nodoc
class _$NotesListStateCopyWithImpl<$Res, $Val extends NotesListState>
    implements $NotesListStateCopyWith<$Res> {
  _$NotesListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotesListStateImplCopyWith<$Res>
    implements $NotesListStateCopyWith<$Res> {
  factory _$$NotesListStateImplCopyWith(_$NotesListStateImpl value,
          $Res Function(_$NotesListStateImpl) then) =
      __$$NotesListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Note> notes});
}

/// @nodoc
class __$$NotesListStateImplCopyWithImpl<$Res>
    extends _$NotesListStateCopyWithImpl<$Res, _$NotesListStateImpl>
    implements _$$NotesListStateImplCopyWith<$Res> {
  __$$NotesListStateImplCopyWithImpl(
      _$NotesListStateImpl _value, $Res Function(_$NotesListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? notes = null,
  }) {
    return _then(_$NotesListStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as List<Note>,
    ));
  }
}

/// @nodoc

class _$NotesListStateImpl implements _NotesListState {
  const _$NotesListStateImpl(
      {this.isLoading = false, final List<Note> notes = const []})
      : _notes = notes;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Note> _notes;
  @override
  @JsonKey()
  List<Note> get notes {
    if (_notes is EqualUnmodifiableListView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notes);
  }

  @override
  String toString() {
    return 'NotesListState.initial(isLoading: $isLoading, notes: $notes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotesListStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotesListStateImplCopyWith<_$NotesListStateImpl> get copyWith =>
      __$$NotesListStateImplCopyWithImpl<_$NotesListStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, List<Note> notes) initial,
  }) {
    return initial(isLoading, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<Note> notes)? initial,
  }) {
    return initial?.call(isLoading, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<Note> notes)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isLoading, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NotesListState value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NotesListState value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NotesListState value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _NotesListState implements NotesListState {
  const factory _NotesListState(
      {final bool isLoading, final List<Note> notes}) = _$NotesListStateImpl;

  @override
  bool get isLoading;
  @override
  List<Note> get notes;
  @override
  @JsonKey(ignore: true)
  _$$NotesListStateImplCopyWith<_$NotesListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
