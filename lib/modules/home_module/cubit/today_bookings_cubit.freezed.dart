// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_bookings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodayBookingsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayBookingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodayBookingsState()';
}


}

/// @nodoc
class $TodayBookingsStateCopyWith<$Res>  {
$TodayBookingsStateCopyWith(TodayBookingsState _, $Res Function(TodayBookingsState) __);
}


/// Adds pattern-matching-related methods to [TodayBookingsState].
extension TodayBookingsStatePatterns on TodayBookingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TodayBookingsInitial value)?  initial,TResult Function( TodayBookingsLoading value)?  loading,TResult Function( TodayBookingsSuccess value)?  success,TResult Function( TodayBookingsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TodayBookingsInitial() when initial != null:
return initial(_that);case TodayBookingsLoading() when loading != null:
return loading(_that);case TodayBookingsSuccess() when success != null:
return success(_that);case TodayBookingsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TodayBookingsInitial value)  initial,required TResult Function( TodayBookingsLoading value)  loading,required TResult Function( TodayBookingsSuccess value)  success,required TResult Function( TodayBookingsError value)  error,}){
final _that = this;
switch (_that) {
case TodayBookingsInitial():
return initial(_that);case TodayBookingsLoading():
return loading(_that);case TodayBookingsSuccess():
return success(_that);case TodayBookingsError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TodayBookingsInitial value)?  initial,TResult? Function( TodayBookingsLoading value)?  loading,TResult? Function( TodayBookingsSuccess value)?  success,TResult? Function( TodayBookingsError value)?  error,}){
final _that = this;
switch (_that) {
case TodayBookingsInitial() when initial != null:
return initial(_that);case TodayBookingsLoading() when loading != null:
return loading(_that);case TodayBookingsSuccess() when success != null:
return success(_that);case TodayBookingsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TodayBookingsModel todayBookings)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TodayBookingsInitial() when initial != null:
return initial();case TodayBookingsLoading() when loading != null:
return loading();case TodayBookingsSuccess() when success != null:
return success(_that.todayBookings);case TodayBookingsError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TodayBookingsModel todayBookings)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TodayBookingsInitial():
return initial();case TodayBookingsLoading():
return loading();case TodayBookingsSuccess():
return success(_that.todayBookings);case TodayBookingsError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TodayBookingsModel todayBookings)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TodayBookingsInitial() when initial != null:
return initial();case TodayBookingsLoading() when loading != null:
return loading();case TodayBookingsSuccess() when success != null:
return success(_that.todayBookings);case TodayBookingsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TodayBookingsInitial implements TodayBookingsState {
  const TodayBookingsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayBookingsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodayBookingsState.initial()';
}


}




/// @nodoc


class TodayBookingsLoading implements TodayBookingsState {
  const TodayBookingsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayBookingsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodayBookingsState.loading()';
}


}




/// @nodoc


class TodayBookingsSuccess implements TodayBookingsState {
  const TodayBookingsSuccess({required this.todayBookings});
  

 final  TodayBookingsModel todayBookings;

/// Create a copy of TodayBookingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayBookingsSuccessCopyWith<TodayBookingsSuccess> get copyWith => _$TodayBookingsSuccessCopyWithImpl<TodayBookingsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayBookingsSuccess&&(identical(other.todayBookings, todayBookings) || other.todayBookings == todayBookings));
}


@override
int get hashCode => Object.hash(runtimeType,todayBookings);

@override
String toString() {
  return 'TodayBookingsState.success(todayBookings: $todayBookings)';
}


}

/// @nodoc
abstract mixin class $TodayBookingsSuccessCopyWith<$Res> implements $TodayBookingsStateCopyWith<$Res> {
  factory $TodayBookingsSuccessCopyWith(TodayBookingsSuccess value, $Res Function(TodayBookingsSuccess) _then) = _$TodayBookingsSuccessCopyWithImpl;
@useResult
$Res call({
 TodayBookingsModel todayBookings
});




}
/// @nodoc
class _$TodayBookingsSuccessCopyWithImpl<$Res>
    implements $TodayBookingsSuccessCopyWith<$Res> {
  _$TodayBookingsSuccessCopyWithImpl(this._self, this._then);

  final TodayBookingsSuccess _self;
  final $Res Function(TodayBookingsSuccess) _then;

/// Create a copy of TodayBookingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? todayBookings = null,}) {
  return _then(TodayBookingsSuccess(
todayBookings: null == todayBookings ? _self.todayBookings : todayBookings // ignore: cast_nullable_to_non_nullable
as TodayBookingsModel,
  ));
}


}

/// @nodoc


class TodayBookingsError implements TodayBookingsState {
  const TodayBookingsError({required this.message});
  

 final  String message;

/// Create a copy of TodayBookingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayBookingsErrorCopyWith<TodayBookingsError> get copyWith => _$TodayBookingsErrorCopyWithImpl<TodayBookingsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayBookingsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TodayBookingsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TodayBookingsErrorCopyWith<$Res> implements $TodayBookingsStateCopyWith<$Res> {
  factory $TodayBookingsErrorCopyWith(TodayBookingsError value, $Res Function(TodayBookingsError) _then) = _$TodayBookingsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TodayBookingsErrorCopyWithImpl<$Res>
    implements $TodayBookingsErrorCopyWith<$Res> {
  _$TodayBookingsErrorCopyWithImpl(this._self, this._then);

  final TodayBookingsError _self;
  final $Res Function(TodayBookingsError) _then;

/// Create a copy of TodayBookingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TodayBookingsError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
