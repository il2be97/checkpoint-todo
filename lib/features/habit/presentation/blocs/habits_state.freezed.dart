// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habits_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HabitsState {

 HabitTab get tab;
/// Create a copy of HabitsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitsStateCopyWith<HabitsState> get copyWith => _$HabitsStateCopyWithImpl<HabitsState>(this as HabitsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitsState&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,tab);

@override
String toString() {
  return 'HabitsState(tab: $tab)';
}


}

/// @nodoc
abstract mixin class $HabitsStateCopyWith<$Res>  {
  factory $HabitsStateCopyWith(HabitsState value, $Res Function(HabitsState) _then) = _$HabitsStateCopyWithImpl;
@useResult
$Res call({
 HabitTab tab
});




}
/// @nodoc
class _$HabitsStateCopyWithImpl<$Res>
    implements $HabitsStateCopyWith<$Res> {
  _$HabitsStateCopyWithImpl(this._self, this._then);

  final HabitsState _self;
  final $Res Function(HabitsState) _then;

/// Create a copy of HabitsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tab = null,}) {
  return _then(_self.copyWith(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as HabitTab,
  ));
}

}


/// Adds pattern-matching-related methods to [HabitsState].
extension HabitsStatePatterns on HabitsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HabitsInitial value)?  initial,TResult Function( HabitsLoading value)?  loading,TResult Function( HabitsLoaded value)?  loaded,TResult Function( HabbitsFailed value)?  failed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HabitsInitial() when initial != null:
return initial(_that);case HabitsLoading() when loading != null:
return loading(_that);case HabitsLoaded() when loaded != null:
return loaded(_that);case HabbitsFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HabitsInitial value)  initial,required TResult Function( HabitsLoading value)  loading,required TResult Function( HabitsLoaded value)  loaded,required TResult Function( HabbitsFailed value)  failed,}){
final _that = this;
switch (_that) {
case HabitsInitial():
return initial(_that);case HabitsLoading():
return loading(_that);case HabitsLoaded():
return loaded(_that);case HabbitsFailed():
return failed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HabitsInitial value)?  initial,TResult? Function( HabitsLoading value)?  loading,TResult? Function( HabitsLoaded value)?  loaded,TResult? Function( HabbitsFailed value)?  failed,}){
final _that = this;
switch (_that) {
case HabitsInitial() when initial != null:
return initial(_that);case HabitsLoading() when loading != null:
return loading(_that);case HabitsLoaded() when loaded != null:
return loaded(_that);case HabbitsFailed() when failed != null:
return failed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( HabitTab tab)?  initial,TResult Function( HabitTab tab)?  loading,TResult Function( HabitTab tab)?  loaded,TResult Function( HabitTab tab,  Error err)?  failed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HabitsInitial() when initial != null:
return initial(_that.tab);case HabitsLoading() when loading != null:
return loading(_that.tab);case HabitsLoaded() when loaded != null:
return loaded(_that.tab);case HabbitsFailed() when failed != null:
return failed(_that.tab,_that.err);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( HabitTab tab)  initial,required TResult Function( HabitTab tab)  loading,required TResult Function( HabitTab tab)  loaded,required TResult Function( HabitTab tab,  Error err)  failed,}) {final _that = this;
switch (_that) {
case HabitsInitial():
return initial(_that.tab);case HabitsLoading():
return loading(_that.tab);case HabitsLoaded():
return loaded(_that.tab);case HabbitsFailed():
return failed(_that.tab,_that.err);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( HabitTab tab)?  initial,TResult? Function( HabitTab tab)?  loading,TResult? Function( HabitTab tab)?  loaded,TResult? Function( HabitTab tab,  Error err)?  failed,}) {final _that = this;
switch (_that) {
case HabitsInitial() when initial != null:
return initial(_that.tab);case HabitsLoading() when loading != null:
return loading(_that.tab);case HabitsLoaded() when loaded != null:
return loaded(_that.tab);case HabbitsFailed() when failed != null:
return failed(_that.tab,_that.err);case _:
  return null;

}
}

}

/// @nodoc


class HabitsInitial extends HabitsState {
  const HabitsInitial({this.tab = HabitTab.active}): super._();
  

@override@JsonKey() final  HabitTab tab;

/// Create a copy of HabitsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitsInitialCopyWith<HabitsInitial> get copyWith => _$HabitsInitialCopyWithImpl<HabitsInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitsInitial&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,tab);

@override
String toString() {
  return 'HabitsState.initial(tab: $tab)';
}


}

/// @nodoc
abstract mixin class $HabitsInitialCopyWith<$Res> implements $HabitsStateCopyWith<$Res> {
  factory $HabitsInitialCopyWith(HabitsInitial value, $Res Function(HabitsInitial) _then) = _$HabitsInitialCopyWithImpl;
@override @useResult
$Res call({
 HabitTab tab
});




}
/// @nodoc
class _$HabitsInitialCopyWithImpl<$Res>
    implements $HabitsInitialCopyWith<$Res> {
  _$HabitsInitialCopyWithImpl(this._self, this._then);

  final HabitsInitial _self;
  final $Res Function(HabitsInitial) _then;

/// Create a copy of HabitsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tab = null,}) {
  return _then(HabitsInitial(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as HabitTab,
  ));
}


}

/// @nodoc


class HabitsLoading extends HabitsState {
  const HabitsLoading({required this.tab}): super._();
  

@override final  HabitTab tab;

/// Create a copy of HabitsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitsLoadingCopyWith<HabitsLoading> get copyWith => _$HabitsLoadingCopyWithImpl<HabitsLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitsLoading&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,tab);

@override
String toString() {
  return 'HabitsState.loading(tab: $tab)';
}


}

/// @nodoc
abstract mixin class $HabitsLoadingCopyWith<$Res> implements $HabitsStateCopyWith<$Res> {
  factory $HabitsLoadingCopyWith(HabitsLoading value, $Res Function(HabitsLoading) _then) = _$HabitsLoadingCopyWithImpl;
@override @useResult
$Res call({
 HabitTab tab
});




}
/// @nodoc
class _$HabitsLoadingCopyWithImpl<$Res>
    implements $HabitsLoadingCopyWith<$Res> {
  _$HabitsLoadingCopyWithImpl(this._self, this._then);

  final HabitsLoading _self;
  final $Res Function(HabitsLoading) _then;

/// Create a copy of HabitsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tab = null,}) {
  return _then(HabitsLoading(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as HabitTab,
  ));
}


}

/// @nodoc


class HabitsLoaded extends HabitsState {
  const HabitsLoaded({required this.tab}): super._();
  

@override final  HabitTab tab;

/// Create a copy of HabitsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitsLoadedCopyWith<HabitsLoaded> get copyWith => _$HabitsLoadedCopyWithImpl<HabitsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitsLoaded&&(identical(other.tab, tab) || other.tab == tab));
}


@override
int get hashCode => Object.hash(runtimeType,tab);

@override
String toString() {
  return 'HabitsState.loaded(tab: $tab)';
}


}

/// @nodoc
abstract mixin class $HabitsLoadedCopyWith<$Res> implements $HabitsStateCopyWith<$Res> {
  factory $HabitsLoadedCopyWith(HabitsLoaded value, $Res Function(HabitsLoaded) _then) = _$HabitsLoadedCopyWithImpl;
@override @useResult
$Res call({
 HabitTab tab
});




}
/// @nodoc
class _$HabitsLoadedCopyWithImpl<$Res>
    implements $HabitsLoadedCopyWith<$Res> {
  _$HabitsLoadedCopyWithImpl(this._self, this._then);

  final HabitsLoaded _self;
  final $Res Function(HabitsLoaded) _then;

/// Create a copy of HabitsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tab = null,}) {
  return _then(HabitsLoaded(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as HabitTab,
  ));
}


}

/// @nodoc


class HabbitsFailed extends HabitsState {
  const HabbitsFailed({required this.tab, required this.err}): super._();
  

@override final  HabitTab tab;
 final  Error err;

/// Create a copy of HabitsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabbitsFailedCopyWith<HabbitsFailed> get copyWith => _$HabbitsFailedCopyWithImpl<HabbitsFailed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabbitsFailed&&(identical(other.tab, tab) || other.tab == tab)&&(identical(other.err, err) || other.err == err));
}


@override
int get hashCode => Object.hash(runtimeType,tab,err);

@override
String toString() {
  return 'HabitsState.failed(tab: $tab, err: $err)';
}


}

/// @nodoc
abstract mixin class $HabbitsFailedCopyWith<$Res> implements $HabitsStateCopyWith<$Res> {
  factory $HabbitsFailedCopyWith(HabbitsFailed value, $Res Function(HabbitsFailed) _then) = _$HabbitsFailedCopyWithImpl;
@override @useResult
$Res call({
 HabitTab tab, Error err
});




}
/// @nodoc
class _$HabbitsFailedCopyWithImpl<$Res>
    implements $HabbitsFailedCopyWith<$Res> {
  _$HabbitsFailedCopyWithImpl(this._self, this._then);

  final HabbitsFailed _self;
  final $Res Function(HabbitsFailed) _then;

/// Create a copy of HabitsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tab = null,Object? err = null,}) {
  return _then(HabbitsFailed(
tab: null == tab ? _self.tab : tab // ignore: cast_nullable_to_non_nullable
as HabitTab,err: null == err ? _self.err : err // ignore: cast_nullable_to_non_nullable
as Error,
  ));
}


}

// dart format on
