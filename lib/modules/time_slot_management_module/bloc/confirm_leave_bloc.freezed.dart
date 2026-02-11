// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'confirm_leave_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConfirmLeaveEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmLeaveEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConfirmLeaveEvent()';
}


}

/// @nodoc
class $ConfirmLeaveEventCopyWith<$Res>  {
$ConfirmLeaveEventCopyWith(ConfirmLeaveEvent _, $Res Function(ConfirmLeaveEvent) __);
}


/// Adds pattern-matching-related methods to [ConfirmLeaveEvent].
extension ConfirmLeaveEventPatterns on ConfirmLeaveEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _ConfirmingLeave value)?  confirmingLeave,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ConfirmingLeave() when confirmingLeave != null:
return confirmingLeave(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _ConfirmingLeave value)  confirmingLeave,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _ConfirmingLeave():
return confirmingLeave(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _ConfirmingLeave value)?  confirmingLeave,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _ConfirmingLeave() when confirmingLeave != null:
return confirmingLeave(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( LeaveApplicationData leaveApplicationData)?  confirmingLeave,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _ConfirmingLeave() when confirmingLeave != null:
return confirmingLeave(_that.leaveApplicationData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( LeaveApplicationData leaveApplicationData)  confirmingLeave,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _ConfirmingLeave():
return confirmingLeave(_that.leaveApplicationData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( LeaveApplicationData leaveApplicationData)?  confirmingLeave,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _ConfirmingLeave() when confirmingLeave != null:
return confirmingLeave(_that.leaveApplicationData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ConfirmLeaveEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConfirmLeaveEvent.started()';
}


}




/// @nodoc


class _ConfirmingLeave implements ConfirmLeaveEvent {
  const _ConfirmingLeave(this.leaveApplicationData);
  

 final  LeaveApplicationData leaveApplicationData;

/// Create a copy of ConfirmLeaveEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmingLeaveCopyWith<_ConfirmingLeave> get copyWith => __$ConfirmingLeaveCopyWithImpl<_ConfirmingLeave>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmingLeave&&const DeepCollectionEquality().equals(other.leaveApplicationData, leaveApplicationData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(leaveApplicationData));

@override
String toString() {
  return 'ConfirmLeaveEvent.confirmingLeave(leaveApplicationData: $leaveApplicationData)';
}


}

/// @nodoc
abstract mixin class _$ConfirmingLeaveCopyWith<$Res> implements $ConfirmLeaveEventCopyWith<$Res> {
  factory _$ConfirmingLeaveCopyWith(_ConfirmingLeave value, $Res Function(_ConfirmingLeave) _then) = __$ConfirmingLeaveCopyWithImpl;
@useResult
$Res call({
 LeaveApplicationData leaveApplicationData
});




}
/// @nodoc
class __$ConfirmingLeaveCopyWithImpl<$Res>
    implements _$ConfirmingLeaveCopyWith<$Res> {
  __$ConfirmingLeaveCopyWithImpl(this._self, this._then);

  final _ConfirmingLeave _self;
  final $Res Function(_ConfirmingLeave) _then;

/// Create a copy of ConfirmLeaveEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? leaveApplicationData = freezed,}) {
  return _then(_ConfirmingLeave(
freezed == leaveApplicationData ? _self.leaveApplicationData : leaveApplicationData // ignore: cast_nullable_to_non_nullable
as LeaveApplicationData,
  ));
}


}

/// @nodoc
mixin _$ConfirmLeaveState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmLeaveState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConfirmLeaveState()';
}


}

/// @nodoc
class $ConfirmLeaveStateCopyWith<$Res>  {
$ConfirmLeaveStateCopyWith(ConfirmLeaveState _, $Res Function(ConfirmLeaveState) __);
}


/// Adds pattern-matching-related methods to [ConfirmLeaveState].
extension ConfirmLeaveStatePatterns on ConfirmLeaveState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConfirmLeaveInitial value)?  initial,TResult Function( ConfirmLeaveLoading value)?  loading,TResult Function( ConfirmLeaveSuccess value)?  success,TResult Function( ConfirmLeaveFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConfirmLeaveInitial() when initial != null:
return initial(_that);case ConfirmLeaveLoading() when loading != null:
return loading(_that);case ConfirmLeaveSuccess() when success != null:
return success(_that);case ConfirmLeaveFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConfirmLeaveInitial value)  initial,required TResult Function( ConfirmLeaveLoading value)  loading,required TResult Function( ConfirmLeaveSuccess value)  success,required TResult Function( ConfirmLeaveFailure value)  failure,}){
final _that = this;
switch (_that) {
case ConfirmLeaveInitial():
return initial(_that);case ConfirmLeaveLoading():
return loading(_that);case ConfirmLeaveSuccess():
return success(_that);case ConfirmLeaveFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConfirmLeaveInitial value)?  initial,TResult? Function( ConfirmLeaveLoading value)?  loading,TResult? Function( ConfirmLeaveSuccess value)?  success,TResult? Function( ConfirmLeaveFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ConfirmLeaveInitial() when initial != null:
return initial(_that);case ConfirmLeaveLoading() when loading != null:
return loading(_that);case ConfirmLeaveSuccess() when success != null:
return success(_that);case ConfirmLeaveFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ConfirmLeaveResponseModel response)?  success,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConfirmLeaveInitial() when initial != null:
return initial();case ConfirmLeaveLoading() when loading != null:
return loading();case ConfirmLeaveSuccess() when success != null:
return success(_that.response);case ConfirmLeaveFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ConfirmLeaveResponseModel response)  success,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case ConfirmLeaveInitial():
return initial();case ConfirmLeaveLoading():
return loading();case ConfirmLeaveSuccess():
return success(_that.response);case ConfirmLeaveFailure():
return failure(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ConfirmLeaveResponseModel response)?  success,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case ConfirmLeaveInitial() when initial != null:
return initial();case ConfirmLeaveLoading() when loading != null:
return loading();case ConfirmLeaveSuccess() when success != null:
return success(_that.response);case ConfirmLeaveFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ConfirmLeaveInitial implements ConfirmLeaveState {
  const ConfirmLeaveInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmLeaveInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConfirmLeaveState.initial()';
}


}




/// @nodoc


class ConfirmLeaveLoading implements ConfirmLeaveState {
  const ConfirmLeaveLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmLeaveLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConfirmLeaveState.loading()';
}


}




/// @nodoc


class ConfirmLeaveSuccess implements ConfirmLeaveState {
  const ConfirmLeaveSuccess(this.response);
  

 final  ConfirmLeaveResponseModel response;

/// Create a copy of ConfirmLeaveState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmLeaveSuccessCopyWith<ConfirmLeaveSuccess> get copyWith => _$ConfirmLeaveSuccessCopyWithImpl<ConfirmLeaveSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmLeaveSuccess&&const DeepCollectionEquality().equals(other.response, response));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(response));

@override
String toString() {
  return 'ConfirmLeaveState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $ConfirmLeaveSuccessCopyWith<$Res> implements $ConfirmLeaveStateCopyWith<$Res> {
  factory $ConfirmLeaveSuccessCopyWith(ConfirmLeaveSuccess value, $Res Function(ConfirmLeaveSuccess) _then) = _$ConfirmLeaveSuccessCopyWithImpl;
@useResult
$Res call({
 ConfirmLeaveResponseModel response
});




}
/// @nodoc
class _$ConfirmLeaveSuccessCopyWithImpl<$Res>
    implements $ConfirmLeaveSuccessCopyWith<$Res> {
  _$ConfirmLeaveSuccessCopyWithImpl(this._self, this._then);

  final ConfirmLeaveSuccess _self;
  final $Res Function(ConfirmLeaveSuccess) _then;

/// Create a copy of ConfirmLeaveState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = freezed,}) {
  return _then(ConfirmLeaveSuccess(
freezed == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as ConfirmLeaveResponseModel,
  ));
}


}

/// @nodoc


class ConfirmLeaveFailure implements ConfirmLeaveState {
  const ConfirmLeaveFailure(this.error);
  

 final  String error;

/// Create a copy of ConfirmLeaveState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmLeaveFailureCopyWith<ConfirmLeaveFailure> get copyWith => _$ConfirmLeaveFailureCopyWithImpl<ConfirmLeaveFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmLeaveFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ConfirmLeaveState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $ConfirmLeaveFailureCopyWith<$Res> implements $ConfirmLeaveStateCopyWith<$Res> {
  factory $ConfirmLeaveFailureCopyWith(ConfirmLeaveFailure value, $Res Function(ConfirmLeaveFailure) _then) = _$ConfirmLeaveFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$ConfirmLeaveFailureCopyWithImpl<$Res>
    implements $ConfirmLeaveFailureCopyWith<$Res> {
  _$ConfirmLeaveFailureCopyWithImpl(this._self, this._then);

  final ConfirmLeaveFailure _self;
  final $Res Function(ConfirmLeaveFailure) _then;

/// Create a copy of ConfirmLeaveState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ConfirmLeaveFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
