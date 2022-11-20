// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserLoadEvent value) load,
    required TResult Function(UserClearEvent value) clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserLoadEvent value)? load,
    TResult? Function(UserClearEvent value)? clear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserLoadEvent value)? load,
    TResult Function(UserClearEvent value)? clear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserLoadEventCopyWith<$Res> {
  factory _$$UserLoadEventCopyWith(
          _$UserLoadEvent value, $Res Function(_$UserLoadEvent) then) =
      __$$UserLoadEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserLoadEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserLoadEvent>
    implements _$$UserLoadEventCopyWith<$Res> {
  __$$UserLoadEventCopyWithImpl(
      _$UserLoadEvent _value, $Res Function(_$UserLoadEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserLoadEvent implements UserLoadEvent {
  const _$UserLoadEvent();

  @override
  String toString() {
    return 'UserEvent.load()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLoadEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() clear,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? clear,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserLoadEvent value) load,
    required TResult Function(UserClearEvent value) clear,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserLoadEvent value)? load,
    TResult? Function(UserClearEvent value)? clear,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserLoadEvent value)? load,
    TResult Function(UserClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class UserLoadEvent implements UserEvent {
  const factory UserLoadEvent() = _$UserLoadEvent;
}

/// @nodoc
abstract class _$$UserClearEventCopyWith<$Res> {
  factory _$$UserClearEventCopyWith(
          _$UserClearEvent value, $Res Function(_$UserClearEvent) then) =
      __$$UserClearEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserClearEventCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserClearEvent>
    implements _$$UserClearEventCopyWith<$Res> {
  __$$UserClearEventCopyWithImpl(
      _$UserClearEvent _value, $Res Function(_$UserClearEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserClearEvent implements UserClearEvent {
  const _$UserClearEvent();

  @override
  String toString() {
    return 'UserEvent.clear()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserClearEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function() clear,
  }) {
    return clear();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function()? clear,
  }) {
    return clear?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function()? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserLoadEvent value) load,
    required TResult Function(UserClearEvent value) clear,
  }) {
    return clear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserLoadEvent value)? load,
    TResult? Function(UserClearEvent value)? clear,
  }) {
    return clear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserLoadEvent value)? load,
    TResult Function(UserClearEvent value)? clear,
    required TResult orElse(),
  }) {
    if (clear != null) {
      return clear(this);
    }
    return orElse();
  }
}

abstract class UserClearEvent implements UserEvent {
  const factory UserClearEvent() = _$UserClearEvent;
}

/// @nodoc
mixin _$UserState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel loadedUser) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel loadedUser)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel loadedUser)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEmptyState value) empty,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserLoadedState value) loaded,
    required TResult Function(UserErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEmptyState value)? empty,
    TResult? Function(UserLoadingState value)? loading,
    TResult? Function(UserLoadedState value)? loaded,
    TResult? Function(UserErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEmptyState value)? empty,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserLoadedState value)? loaded,
    TResult Function(UserErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserEmptyStateCopyWith<$Res> {
  factory _$$UserEmptyStateCopyWith(
          _$UserEmptyState value, $Res Function(_$UserEmptyState) then) =
      __$$UserEmptyStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserEmptyStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserEmptyState>
    implements _$$UserEmptyStateCopyWith<$Res> {
  __$$UserEmptyStateCopyWithImpl(
      _$UserEmptyState _value, $Res Function(_$UserEmptyState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserEmptyState implements UserEmptyState {
  const _$UserEmptyState();

  @override
  String toString() {
    return 'UserState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserEmptyState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel loadedUser) loaded,
    required TResult Function() error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel loadedUser)? loaded,
    TResult? Function()? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel loadedUser)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEmptyState value) empty,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserLoadedState value) loaded,
    required TResult Function(UserErrorState value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEmptyState value)? empty,
    TResult? Function(UserLoadingState value)? loading,
    TResult? Function(UserLoadedState value)? loaded,
    TResult? Function(UserErrorState value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEmptyState value)? empty,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserLoadedState value)? loaded,
    TResult Function(UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class UserEmptyState implements UserState {
  const factory UserEmptyState() = _$UserEmptyState;
}

/// @nodoc
abstract class _$$UserLoadingStateCopyWith<$Res> {
  factory _$$UserLoadingStateCopyWith(
          _$UserLoadingState value, $Res Function(_$UserLoadingState) then) =
      __$$UserLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserLoadingStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserLoadingState>
    implements _$$UserLoadingStateCopyWith<$Res> {
  __$$UserLoadingStateCopyWithImpl(
      _$UserLoadingState _value, $Res Function(_$UserLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserLoadingState implements UserLoadingState {
  const _$UserLoadingState();

  @override
  String toString() {
    return 'UserState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel loadedUser) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel loadedUser)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel loadedUser)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEmptyState value) empty,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserLoadedState value) loaded,
    required TResult Function(UserErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEmptyState value)? empty,
    TResult? Function(UserLoadingState value)? loading,
    TResult? Function(UserLoadedState value)? loaded,
    TResult? Function(UserErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEmptyState value)? empty,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserLoadedState value)? loaded,
    TResult Function(UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserLoadingState implements UserState {
  const factory UserLoadingState() = _$UserLoadingState;
}

/// @nodoc
abstract class _$$UserLoadedStateCopyWith<$Res> {
  factory _$$UserLoadedStateCopyWith(
          _$UserLoadedState value, $Res Function(_$UserLoadedState) then) =
      __$$UserLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel loadedUser});
}

/// @nodoc
class __$$UserLoadedStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserLoadedState>
    implements _$$UserLoadedStateCopyWith<$Res> {
  __$$UserLoadedStateCopyWithImpl(
      _$UserLoadedState _value, $Res Function(_$UserLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadedUser = null,
  }) {
    return _then(_$UserLoadedState(
      loadedUser: null == loadedUser
          ? _value.loadedUser
          : loadedUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$UserLoadedState implements UserLoadedState {
  const _$UserLoadedState({required this.loadedUser});

  @override
  final UserModel loadedUser;

  @override
  String toString() {
    return 'UserState.loaded(loadedUser: $loadedUser)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoadedState &&
            (identical(other.loadedUser, loadedUser) ||
                other.loadedUser == loadedUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadedUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoadedStateCopyWith<_$UserLoadedState> get copyWith =>
      __$$UserLoadedStateCopyWithImpl<_$UserLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel loadedUser) loaded,
    required TResult Function() error,
  }) {
    return loaded(loadedUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel loadedUser)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(loadedUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel loadedUser)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(loadedUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEmptyState value) empty,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserLoadedState value) loaded,
    required TResult Function(UserErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEmptyState value)? empty,
    TResult? Function(UserLoadingState value)? loading,
    TResult? Function(UserLoadedState value)? loaded,
    TResult? Function(UserErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEmptyState value)? empty,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserLoadedState value)? loaded,
    TResult Function(UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class UserLoadedState implements UserState {
  const factory UserLoadedState({required final UserModel loadedUser}) =
      _$UserLoadedState;

  UserModel get loadedUser;
  @JsonKey(ignore: true)
  _$$UserLoadedStateCopyWith<_$UserLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserErrorStateCopyWith<$Res> {
  factory _$$UserErrorStateCopyWith(
          _$UserErrorState value, $Res Function(_$UserErrorState) then) =
      __$$UserErrorStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserErrorStateCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserErrorState>
    implements _$$UserErrorStateCopyWith<$Res> {
  __$$UserErrorStateCopyWithImpl(
      _$UserErrorState _value, $Res Function(_$UserErrorState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserErrorState implements UserErrorState {
  const _$UserErrorState();

  @override
  String toString() {
    return 'UserState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(UserModel loadedUser) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(UserModel loadedUser)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(UserModel loadedUser)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserEmptyState value) empty,
    required TResult Function(UserLoadingState value) loading,
    required TResult Function(UserLoadedState value) loaded,
    required TResult Function(UserErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserEmptyState value)? empty,
    TResult? Function(UserLoadingState value)? loading,
    TResult? Function(UserLoadedState value)? loaded,
    TResult? Function(UserErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserEmptyState value)? empty,
    TResult Function(UserLoadingState value)? loading,
    TResult Function(UserLoadedState value)? loaded,
    TResult Function(UserErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UserErrorState implements UserState {
  const factory UserErrorState() = _$UserErrorState;
}
