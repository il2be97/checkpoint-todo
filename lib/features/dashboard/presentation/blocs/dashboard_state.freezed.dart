// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState()';
}


}

/// @nodoc
class $DashboardStateCopyWith<$Res>  {
$DashboardStateCopyWith(DashboardState _, $Res Function(DashboardState) __);
}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DashboardInitial value)?  initial,TResult Function( DashboardLoaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DashboardInitial() when initial != null:
return initial(_that);case DashboardLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DashboardInitial value)  initial,required TResult Function( DashboardLoaded value)  loaded,}){
final _that = this;
switch (_that) {
case DashboardInitial():
return initial(_that);case DashboardLoaded():
return loaded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DashboardInitial value)?  initial,TResult? Function( DashboardLoaded value)?  loaded,}){
final _that = this;
switch (_that) {
case DashboardInitial() when initial != null:
return initial(_that);case DashboardLoaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( DashboardTab page)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DashboardInitial() when initial != null:
return initial();case DashboardLoaded() when loaded != null:
return loaded(_that.page);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( DashboardTab page)  loaded,}) {final _that = this;
switch (_that) {
case DashboardInitial():
return initial();case DashboardLoaded():
return loaded(_that.page);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( DashboardTab page)?  loaded,}) {final _that = this;
switch (_that) {
case DashboardInitial() when initial != null:
return initial();case DashboardLoaded() when loaded != null:
return loaded(_that.page);case _:
  return null;

}
}

}

/// @nodoc


class DashboardInitial extends DashboardState {
  const DashboardInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DashboardState.initial()';
}


}




/// @nodoc


class DashboardLoaded extends DashboardState {
  const DashboardLoaded({required this.page}): super._();
  

 final  DashboardTab page;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardLoadedCopyWith<DashboardLoaded> get copyWith => _$DashboardLoadedCopyWithImpl<DashboardLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardLoaded&&(identical(other.page, page) || other.page == page));
}


@override
int get hashCode => Object.hash(runtimeType,page);

@override
String toString() {
  return 'DashboardState.loaded(page: $page)';
}


}

/// @nodoc
abstract mixin class $DashboardLoadedCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory $DashboardLoadedCopyWith(DashboardLoaded value, $Res Function(DashboardLoaded) _then) = _$DashboardLoadedCopyWithImpl;
@useResult
$Res call({
 DashboardTab page
});




}
/// @nodoc
class _$DashboardLoadedCopyWithImpl<$Res>
    implements $DashboardLoadedCopyWith<$Res> {
  _$DashboardLoadedCopyWithImpl(this._self, this._then);

  final DashboardLoaded _self;
  final $Res Function(DashboardLoaded) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? page = null,}) {
  return _then(DashboardLoaded(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as DashboardTab,
  ));
}


}

// dart format on
