// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_complaints_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DoctorComplaintsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorComplaintsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorComplaintsState()';
}


}

/// @nodoc
class $DoctorComplaintsStateCopyWith<$Res>  {
$DoctorComplaintsStateCopyWith(DoctorComplaintsState _, $Res Function(DoctorComplaintsState) __);
}


/// Adds pattern-matching-related methods to [DoctorComplaintsState].
extension DoctorComplaintsStatePatterns on DoctorComplaintsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DoctorComplaintsInitial value)?  initial,TResult Function( DoctorComplaintsLoading value)?  loading,TResult Function( DoctorComplaintsLoaded value)?  loaded,TResult Function( DoctorComplaintsError value)?  error,TResult Function( DoctorComplaintsEmpty value)?  empty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DoctorComplaintsInitial() when initial != null:
return initial(_that);case DoctorComplaintsLoading() when loading != null:
return loading(_that);case DoctorComplaintsLoaded() when loaded != null:
return loaded(_that);case DoctorComplaintsError() when error != null:
return error(_that);case DoctorComplaintsEmpty() when empty != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DoctorComplaintsInitial value)  initial,required TResult Function( DoctorComplaintsLoading value)  loading,required TResult Function( DoctorComplaintsLoaded value)  loaded,required TResult Function( DoctorComplaintsError value)  error,required TResult Function( DoctorComplaintsEmpty value)  empty,}){
final _that = this;
switch (_that) {
case DoctorComplaintsInitial():
return initial(_that);case DoctorComplaintsLoading():
return loading(_that);case DoctorComplaintsLoaded():
return loaded(_that);case DoctorComplaintsError():
return error(_that);case DoctorComplaintsEmpty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DoctorComplaintsInitial value)?  initial,TResult? Function( DoctorComplaintsLoading value)?  loading,TResult? Function( DoctorComplaintsLoaded value)?  loaded,TResult? Function( DoctorComplaintsError value)?  error,TResult? Function( DoctorComplaintsEmpty value)?  empty,}){
final _that = this;
switch (_that) {
case DoctorComplaintsInitial() when initial != null:
return initial(_that);case DoctorComplaintsLoading() when loading != null:
return loading(_that);case DoctorComplaintsLoaded() when loaded != null:
return loaded(_that);case DoctorComplaintsError() when error != null:
return error(_that);case DoctorComplaintsEmpty() when empty != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DoctorComplaintsModel doctorComplaintsModel)?  loaded,TResult Function( String error)?  error,TResult Function()?  empty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DoctorComplaintsInitial() when initial != null:
return initial();case DoctorComplaintsLoading() when loading != null:
return loading();case DoctorComplaintsLoaded() when loaded != null:
return loaded(_that.doctorComplaintsModel);case DoctorComplaintsError() when error != null:
return error(_that.error);case DoctorComplaintsEmpty() when empty != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DoctorComplaintsModel doctorComplaintsModel)  loaded,required TResult Function( String error)  error,required TResult Function()  empty,}) {final _that = this;
switch (_that) {
case DoctorComplaintsInitial():
return initial();case DoctorComplaintsLoading():
return loading();case DoctorComplaintsLoaded():
return loaded(_that.doctorComplaintsModel);case DoctorComplaintsError():
return error(_that.error);case DoctorComplaintsEmpty():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DoctorComplaintsModel doctorComplaintsModel)?  loaded,TResult? Function( String error)?  error,TResult? Function()?  empty,}) {final _that = this;
switch (_that) {
case DoctorComplaintsInitial() when initial != null:
return initial();case DoctorComplaintsLoading() when loading != null:
return loading();case DoctorComplaintsLoaded() when loaded != null:
return loaded(_that.doctorComplaintsModel);case DoctorComplaintsError() when error != null:
return error(_that.error);case DoctorComplaintsEmpty() when empty != null:
return empty();case _:
  return null;

}
}

}

/// @nodoc


class DoctorComplaintsInitial implements DoctorComplaintsState {
  const DoctorComplaintsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorComplaintsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorComplaintsState.initial()';
}


}




/// @nodoc


class DoctorComplaintsLoading implements DoctorComplaintsState {
  const DoctorComplaintsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorComplaintsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorComplaintsState.loading()';
}


}




/// @nodoc


class DoctorComplaintsLoaded implements DoctorComplaintsState {
  const DoctorComplaintsLoaded(this.doctorComplaintsModel);
  

 final  DoctorComplaintsModel doctorComplaintsModel;

/// Create a copy of DoctorComplaintsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorComplaintsLoadedCopyWith<DoctorComplaintsLoaded> get copyWith => _$DoctorComplaintsLoadedCopyWithImpl<DoctorComplaintsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorComplaintsLoaded&&(identical(other.doctorComplaintsModel, doctorComplaintsModel) || other.doctorComplaintsModel == doctorComplaintsModel));
}


@override
int get hashCode => Object.hash(runtimeType,doctorComplaintsModel);

@override
String toString() {
  return 'DoctorComplaintsState.loaded(doctorComplaintsModel: $doctorComplaintsModel)';
}


}

/// @nodoc
abstract mixin class $DoctorComplaintsLoadedCopyWith<$Res> implements $DoctorComplaintsStateCopyWith<$Res> {
  factory $DoctorComplaintsLoadedCopyWith(DoctorComplaintsLoaded value, $Res Function(DoctorComplaintsLoaded) _then) = _$DoctorComplaintsLoadedCopyWithImpl;
@useResult
$Res call({
 DoctorComplaintsModel doctorComplaintsModel
});




}
/// @nodoc
class _$DoctorComplaintsLoadedCopyWithImpl<$Res>
    implements $DoctorComplaintsLoadedCopyWith<$Res> {
  _$DoctorComplaintsLoadedCopyWithImpl(this._self, this._then);

  final DoctorComplaintsLoaded _self;
  final $Res Function(DoctorComplaintsLoaded) _then;

/// Create a copy of DoctorComplaintsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? doctorComplaintsModel = null,}) {
  return _then(DoctorComplaintsLoaded(
null == doctorComplaintsModel ? _self.doctorComplaintsModel : doctorComplaintsModel // ignore: cast_nullable_to_non_nullable
as DoctorComplaintsModel,
  ));
}


}

/// @nodoc


class DoctorComplaintsError implements DoctorComplaintsState {
  const DoctorComplaintsError(this.error);
  

 final  String error;

/// Create a copy of DoctorComplaintsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorComplaintsErrorCopyWith<DoctorComplaintsError> get copyWith => _$DoctorComplaintsErrorCopyWithImpl<DoctorComplaintsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorComplaintsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'DoctorComplaintsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $DoctorComplaintsErrorCopyWith<$Res> implements $DoctorComplaintsStateCopyWith<$Res> {
  factory $DoctorComplaintsErrorCopyWith(DoctorComplaintsError value, $Res Function(DoctorComplaintsError) _then) = _$DoctorComplaintsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$DoctorComplaintsErrorCopyWithImpl<$Res>
    implements $DoctorComplaintsErrorCopyWith<$Res> {
  _$DoctorComplaintsErrorCopyWithImpl(this._self, this._then);

  final DoctorComplaintsError _self;
  final $Res Function(DoctorComplaintsError) _then;

/// Create a copy of DoctorComplaintsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(DoctorComplaintsError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DoctorComplaintsEmpty implements DoctorComplaintsState {
  const DoctorComplaintsEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorComplaintsEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorComplaintsState.empty()';
}


}




// dart format on
