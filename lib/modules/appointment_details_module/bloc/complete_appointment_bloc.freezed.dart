// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_appointment_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CompleteAppointmentEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteAppointmentEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteAppointmentEvent()';
}


}

/// @nodoc
class $CompleteAppointmentEventCopyWith<$Res>  {
$CompleteAppointmentEventCopyWith(CompleteAppointmentEvent _, $Res Function(CompleteAppointmentEvent) __);
}


/// Adds pattern-matching-related methods to [CompleteAppointmentEvent].
extension CompleteAppointmentEventPatterns on CompleteAppointmentEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _CompletingAppointment value)?  completingAppointment,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CompletingAppointment() when completingAppointment != null:
return completingAppointment(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _CompletingAppointment value)  completingAppointment,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _CompletingAppointment():
return completingAppointment(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _CompletingAppointment value)?  completingAppointment,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CompletingAppointment() when completingAppointment != null:
return completingAppointment(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( CompleteAppointmentData completeAppointmentData)?  completingAppointment,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CompletingAppointment() when completingAppointment != null:
return completingAppointment(_that.completeAppointmentData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( CompleteAppointmentData completeAppointmentData)  completingAppointment,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _CompletingAppointment():
return completingAppointment(_that.completeAppointmentData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( CompleteAppointmentData completeAppointmentData)?  completingAppointment,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CompletingAppointment() when completingAppointment != null:
return completingAppointment(_that.completeAppointmentData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CompleteAppointmentEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteAppointmentEvent.started()';
}


}




/// @nodoc


class _CompletingAppointment implements CompleteAppointmentEvent {
  const _CompletingAppointment(this.completeAppointmentData);
  

 final  CompleteAppointmentData completeAppointmentData;

/// Create a copy of CompleteAppointmentEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletingAppointmentCopyWith<_CompletingAppointment> get copyWith => __$CompletingAppointmentCopyWithImpl<_CompletingAppointment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CompletingAppointment&&(identical(other.completeAppointmentData, completeAppointmentData) || other.completeAppointmentData == completeAppointmentData));
}


@override
int get hashCode => Object.hash(runtimeType,completeAppointmentData);

@override
String toString() {
  return 'CompleteAppointmentEvent.completingAppointment(completeAppointmentData: $completeAppointmentData)';
}


}

/// @nodoc
abstract mixin class _$CompletingAppointmentCopyWith<$Res> implements $CompleteAppointmentEventCopyWith<$Res> {
  factory _$CompletingAppointmentCopyWith(_CompletingAppointment value, $Res Function(_CompletingAppointment) _then) = __$CompletingAppointmentCopyWithImpl;
@useResult
$Res call({
 CompleteAppointmentData completeAppointmentData
});




}
/// @nodoc
class __$CompletingAppointmentCopyWithImpl<$Res>
    implements _$CompletingAppointmentCopyWith<$Res> {
  __$CompletingAppointmentCopyWithImpl(this._self, this._then);

  final _CompletingAppointment _self;
  final $Res Function(_CompletingAppointment) _then;

/// Create a copy of CompleteAppointmentEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? completeAppointmentData = null,}) {
  return _then(_CompletingAppointment(
null == completeAppointmentData ? _self.completeAppointmentData : completeAppointmentData // ignore: cast_nullable_to_non_nullable
as CompleteAppointmentData,
  ));
}


}

/// @nodoc
mixin _$CompleteAppointmentState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteAppointmentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteAppointmentState()';
}


}

/// @nodoc
class $CompleteAppointmentStateCopyWith<$Res>  {
$CompleteAppointmentStateCopyWith(CompleteAppointmentState _, $Res Function(CompleteAppointmentState) __);
}


/// Adds pattern-matching-related methods to [CompleteAppointmentState].
extension CompleteAppointmentStatePatterns on CompleteAppointmentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CompleteAppointmentInitial value)?  initial,TResult Function( CompleteAppointmentLoading value)?  loading,TResult Function( CompleteAppointmentSuccess value)?  success,TResult Function( CompleteAppointmentError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CompleteAppointmentInitial() when initial != null:
return initial(_that);case CompleteAppointmentLoading() when loading != null:
return loading(_that);case CompleteAppointmentSuccess() when success != null:
return success(_that);case CompleteAppointmentError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CompleteAppointmentInitial value)  initial,required TResult Function( CompleteAppointmentLoading value)  loading,required TResult Function( CompleteAppointmentSuccess value)  success,required TResult Function( CompleteAppointmentError value)  error,}){
final _that = this;
switch (_that) {
case CompleteAppointmentInitial():
return initial(_that);case CompleteAppointmentLoading():
return loading(_that);case CompleteAppointmentSuccess():
return success(_that);case CompleteAppointmentError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CompleteAppointmentInitial value)?  initial,TResult? Function( CompleteAppointmentLoading value)?  loading,TResult? Function( CompleteAppointmentSuccess value)?  success,TResult? Function( CompleteAppointmentError value)?  error,}){
final _that = this;
switch (_that) {
case CompleteAppointmentInitial() when initial != null:
return initial(_that);case CompleteAppointmentLoading() when loading != null:
return loading(_that);case CompleteAppointmentSuccess() when success != null:
return success(_that);case CompleteAppointmentError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( CompleteAppointmentResponseModel response)?  success,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CompleteAppointmentInitial() when initial != null:
return initial();case CompleteAppointmentLoading() when loading != null:
return loading();case CompleteAppointmentSuccess() when success != null:
return success(_that.response);case CompleteAppointmentError() when error != null:
return error(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( CompleteAppointmentResponseModel response)  success,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case CompleteAppointmentInitial():
return initial();case CompleteAppointmentLoading():
return loading();case CompleteAppointmentSuccess():
return success(_that.response);case CompleteAppointmentError():
return error(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( CompleteAppointmentResponseModel response)?  success,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case CompleteAppointmentInitial() when initial != null:
return initial();case CompleteAppointmentLoading() when loading != null:
return loading();case CompleteAppointmentSuccess() when success != null:
return success(_that.response);case CompleteAppointmentError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class CompleteAppointmentInitial implements CompleteAppointmentState {
  const CompleteAppointmentInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteAppointmentInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteAppointmentState.initial()';
}


}




/// @nodoc


class CompleteAppointmentLoading implements CompleteAppointmentState {
  const CompleteAppointmentLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteAppointmentLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CompleteAppointmentState.loading()';
}


}




/// @nodoc


class CompleteAppointmentSuccess implements CompleteAppointmentState {
  const CompleteAppointmentSuccess(this.response);
  

 final  CompleteAppointmentResponseModel response;

/// Create a copy of CompleteAppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteAppointmentSuccessCopyWith<CompleteAppointmentSuccess> get copyWith => _$CompleteAppointmentSuccessCopyWithImpl<CompleteAppointmentSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteAppointmentSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'CompleteAppointmentState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $CompleteAppointmentSuccessCopyWith<$Res> implements $CompleteAppointmentStateCopyWith<$Res> {
  factory $CompleteAppointmentSuccessCopyWith(CompleteAppointmentSuccess value, $Res Function(CompleteAppointmentSuccess) _then) = _$CompleteAppointmentSuccessCopyWithImpl;
@useResult
$Res call({
 CompleteAppointmentResponseModel response
});




}
/// @nodoc
class _$CompleteAppointmentSuccessCopyWithImpl<$Res>
    implements $CompleteAppointmentSuccessCopyWith<$Res> {
  _$CompleteAppointmentSuccessCopyWithImpl(this._self, this._then);

  final CompleteAppointmentSuccess _self;
  final $Res Function(CompleteAppointmentSuccess) _then;

/// Create a copy of CompleteAppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(CompleteAppointmentSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as CompleteAppointmentResponseModel,
  ));
}


}

/// @nodoc


class CompleteAppointmentError implements CompleteAppointmentState {
  const CompleteAppointmentError(this.error);
  

 final  String error;

/// Create a copy of CompleteAppointmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteAppointmentErrorCopyWith<CompleteAppointmentError> get copyWith => _$CompleteAppointmentErrorCopyWithImpl<CompleteAppointmentError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteAppointmentError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CompleteAppointmentState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $CompleteAppointmentErrorCopyWith<$Res> implements $CompleteAppointmentStateCopyWith<$Res> {
  factory $CompleteAppointmentErrorCopyWith(CompleteAppointmentError value, $Res Function(CompleteAppointmentError) _then) = _$CompleteAppointmentErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$CompleteAppointmentErrorCopyWithImpl<$Res>
    implements $CompleteAppointmentErrorCopyWith<$Res> {
  _$CompleteAppointmentErrorCopyWithImpl(this._self, this._then);

  final CompleteAppointmentError _self;
  final $Res Function(CompleteAppointmentError) _then;

/// Create a copy of CompleteAppointmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CompleteAppointmentError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
