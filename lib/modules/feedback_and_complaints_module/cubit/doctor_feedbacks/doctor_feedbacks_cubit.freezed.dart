// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_feedbacks_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DoctorFeedbacksState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorFeedbacksState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorFeedbacksState()';
}


}

/// @nodoc
class $DoctorFeedbacksStateCopyWith<$Res>  {
$DoctorFeedbacksStateCopyWith(DoctorFeedbacksState _, $Res Function(DoctorFeedbacksState) __);
}


/// Adds pattern-matching-related methods to [DoctorFeedbacksState].
extension DoctorFeedbacksStatePatterns on DoctorFeedbacksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DoctorFeedbacksInitial value)?  initial,TResult Function( DoctorFeedbacksLoading value)?  loading,TResult Function( DoctorFeedbacksLoaded value)?  loaded,TResult Function( DoctorFeedbacksError value)?  error,TResult Function( DoctorFeedbacksEmpty value)?  empty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DoctorFeedbacksInitial() when initial != null:
return initial(_that);case DoctorFeedbacksLoading() when loading != null:
return loading(_that);case DoctorFeedbacksLoaded() when loaded != null:
return loaded(_that);case DoctorFeedbacksError() when error != null:
return error(_that);case DoctorFeedbacksEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DoctorFeedbacksInitial value)  initial,required TResult Function( DoctorFeedbacksLoading value)  loading,required TResult Function( DoctorFeedbacksLoaded value)  loaded,required TResult Function( DoctorFeedbacksError value)  error,required TResult Function( DoctorFeedbacksEmpty value)  empty,}){
final _that = this;
switch (_that) {
case DoctorFeedbacksInitial():
return initial(_that);case DoctorFeedbacksLoading():
return loading(_that);case DoctorFeedbacksLoaded():
return loaded(_that);case DoctorFeedbacksError():
return error(_that);case DoctorFeedbacksEmpty():
return empty(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DoctorFeedbacksInitial value)?  initial,TResult? Function( DoctorFeedbacksLoading value)?  loading,TResult? Function( DoctorFeedbacksLoaded value)?  loaded,TResult? Function( DoctorFeedbacksError value)?  error,TResult? Function( DoctorFeedbacksEmpty value)?  empty,}){
final _that = this;
switch (_that) {
case DoctorFeedbacksInitial() when initial != null:
return initial(_that);case DoctorFeedbacksLoading() when loading != null:
return loading(_that);case DoctorFeedbacksLoaded() when loaded != null:
return loaded(_that);case DoctorFeedbacksError() when error != null:
return error(_that);case DoctorFeedbacksEmpty() when empty != null:
return empty(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DoctorFeedbackModel doctorFeedbackModel)?  loaded,TResult Function( String error)?  error,TResult Function()?  empty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DoctorFeedbacksInitial() when initial != null:
return initial();case DoctorFeedbacksLoading() when loading != null:
return loading();case DoctorFeedbacksLoaded() when loaded != null:
return loaded(_that.doctorFeedbackModel);case DoctorFeedbacksError() when error != null:
return error(_that.error);case DoctorFeedbacksEmpty() when empty != null:
return empty();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DoctorFeedbackModel doctorFeedbackModel)  loaded,required TResult Function( String error)  error,required TResult Function()  empty,}) {final _that = this;
switch (_that) {
case DoctorFeedbacksInitial():
return initial();case DoctorFeedbacksLoading():
return loading();case DoctorFeedbacksLoaded():
return loaded(_that.doctorFeedbackModel);case DoctorFeedbacksError():
return error(_that.error);case DoctorFeedbacksEmpty():
return empty();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DoctorFeedbackModel doctorFeedbackModel)?  loaded,TResult? Function( String error)?  error,TResult? Function()?  empty,}) {final _that = this;
switch (_that) {
case DoctorFeedbacksInitial() when initial != null:
return initial();case DoctorFeedbacksLoading() when loading != null:
return loading();case DoctorFeedbacksLoaded() when loaded != null:
return loaded(_that.doctorFeedbackModel);case DoctorFeedbacksError() when error != null:
return error(_that.error);case DoctorFeedbacksEmpty() when empty != null:
return empty();case _:
  return null;

}
}

}

/// @nodoc


class DoctorFeedbacksInitial implements DoctorFeedbacksState {
  const DoctorFeedbacksInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorFeedbacksInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorFeedbacksState.initial()';
}


}




/// @nodoc


class DoctorFeedbacksLoading implements DoctorFeedbacksState {
  const DoctorFeedbacksLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorFeedbacksLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorFeedbacksState.loading()';
}


}




/// @nodoc


class DoctorFeedbacksLoaded implements DoctorFeedbacksState {
  const DoctorFeedbacksLoaded(this.doctorFeedbackModel);
  

 final  DoctorFeedbackModel doctorFeedbackModel;

/// Create a copy of DoctorFeedbacksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorFeedbacksLoadedCopyWith<DoctorFeedbacksLoaded> get copyWith => _$DoctorFeedbacksLoadedCopyWithImpl<DoctorFeedbacksLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorFeedbacksLoaded&&(identical(other.doctorFeedbackModel, doctorFeedbackModel) || other.doctorFeedbackModel == doctorFeedbackModel));
}


@override
int get hashCode => Object.hash(runtimeType,doctorFeedbackModel);

@override
String toString() {
  return 'DoctorFeedbacksState.loaded(doctorFeedbackModel: $doctorFeedbackModel)';
}


}

/// @nodoc
abstract mixin class $DoctorFeedbacksLoadedCopyWith<$Res> implements $DoctorFeedbacksStateCopyWith<$Res> {
  factory $DoctorFeedbacksLoadedCopyWith(DoctorFeedbacksLoaded value, $Res Function(DoctorFeedbacksLoaded) _then) = _$DoctorFeedbacksLoadedCopyWithImpl;
@useResult
$Res call({
 DoctorFeedbackModel doctorFeedbackModel
});




}
/// @nodoc
class _$DoctorFeedbacksLoadedCopyWithImpl<$Res>
    implements $DoctorFeedbacksLoadedCopyWith<$Res> {
  _$DoctorFeedbacksLoadedCopyWithImpl(this._self, this._then);

  final DoctorFeedbacksLoaded _self;
  final $Res Function(DoctorFeedbacksLoaded) _then;

/// Create a copy of DoctorFeedbacksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? doctorFeedbackModel = null,}) {
  return _then(DoctorFeedbacksLoaded(
null == doctorFeedbackModel ? _self.doctorFeedbackModel : doctorFeedbackModel // ignore: cast_nullable_to_non_nullable
as DoctorFeedbackModel,
  ));
}


}

/// @nodoc


class DoctorFeedbacksError implements DoctorFeedbacksState {
  const DoctorFeedbacksError(this.error);
  

 final  String error;

/// Create a copy of DoctorFeedbacksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorFeedbacksErrorCopyWith<DoctorFeedbacksError> get copyWith => _$DoctorFeedbacksErrorCopyWithImpl<DoctorFeedbacksError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorFeedbacksError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'DoctorFeedbacksState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $DoctorFeedbacksErrorCopyWith<$Res> implements $DoctorFeedbacksStateCopyWith<$Res> {
  factory $DoctorFeedbacksErrorCopyWith(DoctorFeedbacksError value, $Res Function(DoctorFeedbacksError) _then) = _$DoctorFeedbacksErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$DoctorFeedbacksErrorCopyWithImpl<$Res>
    implements $DoctorFeedbacksErrorCopyWith<$Res> {
  _$DoctorFeedbacksErrorCopyWithImpl(this._self, this._then);

  final DoctorFeedbacksError _self;
  final $Res Function(DoctorFeedbacksError) _then;

/// Create a copy of DoctorFeedbacksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DoctorFeedbacksError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DoctorFeedbacksEmpty implements DoctorFeedbacksState {
  const DoctorFeedbacksEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorFeedbacksEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorFeedbacksState.empty()';
}


}




// dart format on
