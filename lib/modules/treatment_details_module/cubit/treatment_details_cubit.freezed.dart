// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treatment_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TreatmentDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreatmentDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TreatmentDetailsState()';
}


}

/// @nodoc
class $TreatmentDetailsStateCopyWith<$Res>  {
$TreatmentDetailsStateCopyWith(TreatmentDetailsState _, $Res Function(TreatmentDetailsState) __);
}


/// Adds pattern-matching-related methods to [TreatmentDetailsState].
extension TreatmentDetailsStatePatterns on TreatmentDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TreatmentDetailsInitial value)?  initial,TResult Function( TreatmentDetailsLoading value)?  loading,TResult Function( TreatmentDetailsSuccess value)?  success,TResult Function( TreatmentDetailsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TreatmentDetailsInitial() when initial != null:
return initial(_that);case TreatmentDetailsLoading() when loading != null:
return loading(_that);case TreatmentDetailsSuccess() when success != null:
return success(_that);case TreatmentDetailsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TreatmentDetailsInitial value)  initial,required TResult Function( TreatmentDetailsLoading value)  loading,required TResult Function( TreatmentDetailsSuccess value)  success,required TResult Function( TreatmentDetailsError value)  error,}){
final _that = this;
switch (_that) {
case TreatmentDetailsInitial():
return initial(_that);case TreatmentDetailsLoading():
return loading(_that);case TreatmentDetailsSuccess():
return success(_that);case TreatmentDetailsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TreatmentDetailsInitial value)?  initial,TResult? Function( TreatmentDetailsLoading value)?  loading,TResult? Function( TreatmentDetailsSuccess value)?  success,TResult? Function( TreatmentDetailsError value)?  error,}){
final _that = this;
switch (_that) {
case TreatmentDetailsInitial() when initial != null:
return initial(_that);case TreatmentDetailsLoading() when loading != null:
return loading(_that);case TreatmentDetailsSuccess() when success != null:
return success(_that);case TreatmentDetailsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TreatmentDetailsModel data)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TreatmentDetailsInitial() when initial != null:
return initial();case TreatmentDetailsLoading() when loading != null:
return loading();case TreatmentDetailsSuccess() when success != null:
return success(_that.data);case TreatmentDetailsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TreatmentDetailsModel data)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TreatmentDetailsInitial():
return initial();case TreatmentDetailsLoading():
return loading();case TreatmentDetailsSuccess():
return success(_that.data);case TreatmentDetailsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TreatmentDetailsModel data)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TreatmentDetailsInitial() when initial != null:
return initial();case TreatmentDetailsLoading() when loading != null:
return loading();case TreatmentDetailsSuccess() when success != null:
return success(_that.data);case TreatmentDetailsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TreatmentDetailsInitial implements TreatmentDetailsState {
  const TreatmentDetailsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreatmentDetailsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TreatmentDetailsState.initial()';
}


}




/// @nodoc


class TreatmentDetailsLoading implements TreatmentDetailsState {
  const TreatmentDetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreatmentDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TreatmentDetailsState.loading()';
}


}




/// @nodoc


class TreatmentDetailsSuccess implements TreatmentDetailsState {
  const TreatmentDetailsSuccess(this.data);
  

 final  TreatmentDetailsModel data;

/// Create a copy of TreatmentDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreatmentDetailsSuccessCopyWith<TreatmentDetailsSuccess> get copyWith => _$TreatmentDetailsSuccessCopyWithImpl<TreatmentDetailsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreatmentDetailsSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'TreatmentDetailsState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $TreatmentDetailsSuccessCopyWith<$Res> implements $TreatmentDetailsStateCopyWith<$Res> {
  factory $TreatmentDetailsSuccessCopyWith(TreatmentDetailsSuccess value, $Res Function(TreatmentDetailsSuccess) _then) = _$TreatmentDetailsSuccessCopyWithImpl;
@useResult
$Res call({
 TreatmentDetailsModel data
});




}
/// @nodoc
class _$TreatmentDetailsSuccessCopyWithImpl<$Res>
    implements $TreatmentDetailsSuccessCopyWith<$Res> {
  _$TreatmentDetailsSuccessCopyWithImpl(this._self, this._then);

  final TreatmentDetailsSuccess _self;
  final $Res Function(TreatmentDetailsSuccess) _then;

/// Create a copy of TreatmentDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(TreatmentDetailsSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TreatmentDetailsModel,
  ));
}


}

/// @nodoc


class TreatmentDetailsError implements TreatmentDetailsState {
  const TreatmentDetailsError(this.message);
  

 final  String message;

/// Create a copy of TreatmentDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreatmentDetailsErrorCopyWith<TreatmentDetailsError> get copyWith => _$TreatmentDetailsErrorCopyWithImpl<TreatmentDetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreatmentDetailsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TreatmentDetailsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TreatmentDetailsErrorCopyWith<$Res> implements $TreatmentDetailsStateCopyWith<$Res> {
  factory $TreatmentDetailsErrorCopyWith(TreatmentDetailsError value, $Res Function(TreatmentDetailsError) _then) = _$TreatmentDetailsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TreatmentDetailsErrorCopyWithImpl<$Res>
    implements $TreatmentDetailsErrorCopyWith<$Res> {
  _$TreatmentDetailsErrorCopyWithImpl(this._self, this._then);

  final TreatmentDetailsError _self;
  final $Res Function(TreatmentDetailsError) _then;

/// Create a copy of TreatmentDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TreatmentDetailsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
