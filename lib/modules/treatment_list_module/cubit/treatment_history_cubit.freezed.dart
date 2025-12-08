// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'treatment_history_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TreatmentHistoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreatmentHistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TreatmentHistoryState()';
}


}

/// @nodoc
class $TreatmentHistoryStateCopyWith<$Res>  {
$TreatmentHistoryStateCopyWith(TreatmentHistoryState _, $Res Function(TreatmentHistoryState) __);
}


/// Adds pattern-matching-related methods to [TreatmentHistoryState].
extension TreatmentHistoryStatePatterns on TreatmentHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TreatmentHistoryInitial value)?  initial,TResult Function( TreatmentHistoryLoading value)?  loading,TResult Function( TreatmentHistorySuccess value)?  success,TResult Function( TreatmentHistoryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TreatmentHistoryInitial() when initial != null:
return initial(_that);case TreatmentHistoryLoading() when loading != null:
return loading(_that);case TreatmentHistorySuccess() when success != null:
return success(_that);case TreatmentHistoryError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TreatmentHistoryInitial value)  initial,required TResult Function( TreatmentHistoryLoading value)  loading,required TResult Function( TreatmentHistorySuccess value)  success,required TResult Function( TreatmentHistoryError value)  error,}){
final _that = this;
switch (_that) {
case TreatmentHistoryInitial():
return initial(_that);case TreatmentHistoryLoading():
return loading(_that);case TreatmentHistorySuccess():
return success(_that);case TreatmentHistoryError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TreatmentHistoryInitial value)?  initial,TResult? Function( TreatmentHistoryLoading value)?  loading,TResult? Function( TreatmentHistorySuccess value)?  success,TResult? Function( TreatmentHistoryError value)?  error,}){
final _that = this;
switch (_that) {
case TreatmentHistoryInitial() when initial != null:
return initial(_that);case TreatmentHistoryLoading() when loading != null:
return loading(_that);case TreatmentHistorySuccess() when success != null:
return success(_that);case TreatmentHistoryError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TreatmentHistoryModel treatmentHistory)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TreatmentHistoryInitial() when initial != null:
return initial();case TreatmentHistoryLoading() when loading != null:
return loading();case TreatmentHistorySuccess() when success != null:
return success(_that.treatmentHistory);case TreatmentHistoryError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TreatmentHistoryModel treatmentHistory)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TreatmentHistoryInitial():
return initial();case TreatmentHistoryLoading():
return loading();case TreatmentHistorySuccess():
return success(_that.treatmentHistory);case TreatmentHistoryError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TreatmentHistoryModel treatmentHistory)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TreatmentHistoryInitial() when initial != null:
return initial();case TreatmentHistoryLoading() when loading != null:
return loading();case TreatmentHistorySuccess() when success != null:
return success(_that.treatmentHistory);case TreatmentHistoryError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TreatmentHistoryInitial implements TreatmentHistoryState {
  const TreatmentHistoryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreatmentHistoryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TreatmentHistoryState.initial()';
}


}




/// @nodoc


class TreatmentHistoryLoading implements TreatmentHistoryState {
  const TreatmentHistoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreatmentHistoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TreatmentHistoryState.loading()';
}


}




/// @nodoc


class TreatmentHistorySuccess implements TreatmentHistoryState {
  const TreatmentHistorySuccess(this.treatmentHistory);
  

 final  TreatmentHistoryModel treatmentHistory;

/// Create a copy of TreatmentHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreatmentHistorySuccessCopyWith<TreatmentHistorySuccess> get copyWith => _$TreatmentHistorySuccessCopyWithImpl<TreatmentHistorySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreatmentHistorySuccess&&(identical(other.treatmentHistory, treatmentHistory) || other.treatmentHistory == treatmentHistory));
}


@override
int get hashCode => Object.hash(runtimeType,treatmentHistory);

@override
String toString() {
  return 'TreatmentHistoryState.success(treatmentHistory: $treatmentHistory)';
}


}

/// @nodoc
abstract mixin class $TreatmentHistorySuccessCopyWith<$Res> implements $TreatmentHistoryStateCopyWith<$Res> {
  factory $TreatmentHistorySuccessCopyWith(TreatmentHistorySuccess value, $Res Function(TreatmentHistorySuccess) _then) = _$TreatmentHistorySuccessCopyWithImpl;
@useResult
$Res call({
 TreatmentHistoryModel treatmentHistory
});




}
/// @nodoc
class _$TreatmentHistorySuccessCopyWithImpl<$Res>
    implements $TreatmentHistorySuccessCopyWith<$Res> {
  _$TreatmentHistorySuccessCopyWithImpl(this._self, this._then);

  final TreatmentHistorySuccess _self;
  final $Res Function(TreatmentHistorySuccess) _then;

/// Create a copy of TreatmentHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? treatmentHistory = null,}) {
  return _then(TreatmentHistorySuccess(
null == treatmentHistory ? _self.treatmentHistory : treatmentHistory // ignore: cast_nullable_to_non_nullable
as TreatmentHistoryModel,
  ));
}


}

/// @nodoc


class TreatmentHistoryError implements TreatmentHistoryState {
  const TreatmentHistoryError(this.message);
  

 final  String message;

/// Create a copy of TreatmentHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TreatmentHistoryErrorCopyWith<TreatmentHistoryError> get copyWith => _$TreatmentHistoryErrorCopyWithImpl<TreatmentHistoryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TreatmentHistoryError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TreatmentHistoryState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TreatmentHistoryErrorCopyWith<$Res> implements $TreatmentHistoryStateCopyWith<$Res> {
  factory $TreatmentHistoryErrorCopyWith(TreatmentHistoryError value, $Res Function(TreatmentHistoryError) _then) = _$TreatmentHistoryErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TreatmentHistoryErrorCopyWithImpl<$Res>
    implements $TreatmentHistoryErrorCopyWith<$Res> {
  _$TreatmentHistoryErrorCopyWithImpl(this._self, this._then);

  final TreatmentHistoryError _self;
  final $Res Function(TreatmentHistoryError) _then;

/// Create a copy of TreatmentHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TreatmentHistoryError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
