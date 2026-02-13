// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prescription_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PrescriptionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrescriptionState()';
}


}

/// @nodoc
class $PrescriptionStateCopyWith<$Res>  {
$PrescriptionStateCopyWith(PrescriptionState _, $Res Function(PrescriptionState) __);
}


/// Adds pattern-matching-related methods to [PrescriptionState].
extension PrescriptionStatePatterns on PrescriptionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PrescriptionInitial value)?  initial,TResult Function( PrescriptionLoading value)?  loading,TResult Function( PrescriptionLoaded value)?  loaded,TResult Function( PrescriptionError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PrescriptionInitial() when initial != null:
return initial(_that);case PrescriptionLoading() when loading != null:
return loading(_that);case PrescriptionLoaded() when loaded != null:
return loaded(_that);case PrescriptionError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PrescriptionInitial value)  initial,required TResult Function( PrescriptionLoading value)  loading,required TResult Function( PrescriptionLoaded value)  loaded,required TResult Function( PrescriptionError value)  error,}){
final _that = this;
switch (_that) {
case PrescriptionInitial():
return initial(_that);case PrescriptionLoading():
return loading(_that);case PrescriptionLoaded():
return loaded(_that);case PrescriptionError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PrescriptionInitial value)?  initial,TResult? Function( PrescriptionLoading value)?  loading,TResult? Function( PrescriptionLoaded value)?  loaded,TResult? Function( PrescriptionError value)?  error,}){
final _that = this;
switch (_that) {
case PrescriptionInitial() when initial != null:
return initial(_that);case PrescriptionLoading() when loading != null:
return loading(_that);case PrescriptionLoaded() when loaded != null:
return loaded(_that);case PrescriptionError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PrescriptionModel prescriptionModel)?  loaded,TResult Function( String error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PrescriptionInitial() when initial != null:
return initial();case PrescriptionLoading() when loading != null:
return loading();case PrescriptionLoaded() when loaded != null:
return loaded(_that.prescriptionModel);case PrescriptionError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PrescriptionModel prescriptionModel)  loaded,required TResult Function( String error)  error,}) {final _that = this;
switch (_that) {
case PrescriptionInitial():
return initial();case PrescriptionLoading():
return loading();case PrescriptionLoaded():
return loaded(_that.prescriptionModel);case PrescriptionError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PrescriptionModel prescriptionModel)?  loaded,TResult? Function( String error)?  error,}) {final _that = this;
switch (_that) {
case PrescriptionInitial() when initial != null:
return initial();case PrescriptionLoading() when loading != null:
return loading();case PrescriptionLoaded() when loaded != null:
return loaded(_that.prescriptionModel);case PrescriptionError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class PrescriptionInitial implements PrescriptionState {
  const PrescriptionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrescriptionState.initial()';
}


}




/// @nodoc


class PrescriptionLoading implements PrescriptionState {
  const PrescriptionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PrescriptionState.loading()';
}


}




/// @nodoc


class PrescriptionLoaded implements PrescriptionState {
  const PrescriptionLoaded(this.prescriptionModel);
  

 final  PrescriptionModel prescriptionModel;

/// Create a copy of PrescriptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionLoadedCopyWith<PrescriptionLoaded> get copyWith => _$PrescriptionLoadedCopyWithImpl<PrescriptionLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionLoaded&&(identical(other.prescriptionModel, prescriptionModel) || other.prescriptionModel == prescriptionModel));
}


@override
int get hashCode => Object.hash(runtimeType,prescriptionModel);

@override
String toString() {
  return 'PrescriptionState.loaded(prescriptionModel: $prescriptionModel)';
}


}

/// @nodoc
abstract mixin class $PrescriptionLoadedCopyWith<$Res> implements $PrescriptionStateCopyWith<$Res> {
  factory $PrescriptionLoadedCopyWith(PrescriptionLoaded value, $Res Function(PrescriptionLoaded) _then) = _$PrescriptionLoadedCopyWithImpl;
@useResult
$Res call({
 PrescriptionModel prescriptionModel
});




}
/// @nodoc
class _$PrescriptionLoadedCopyWithImpl<$Res>
    implements $PrescriptionLoadedCopyWith<$Res> {
  _$PrescriptionLoadedCopyWithImpl(this._self, this._then);

  final PrescriptionLoaded _self;
  final $Res Function(PrescriptionLoaded) _then;

/// Create a copy of PrescriptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? prescriptionModel = null,}) {
  return _then(PrescriptionLoaded(
null == prescriptionModel ? _self.prescriptionModel : prescriptionModel // ignore: cast_nullable_to_non_nullable
as PrescriptionModel,
  ));
}


}

/// @nodoc


class PrescriptionError implements PrescriptionState {
  const PrescriptionError(this.error);
  

 final  String error;

/// Create a copy of PrescriptionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrescriptionErrorCopyWith<PrescriptionError> get copyWith => _$PrescriptionErrorCopyWithImpl<PrescriptionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrescriptionError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'PrescriptionState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $PrescriptionErrorCopyWith<$Res> implements $PrescriptionStateCopyWith<$Res> {
  factory $PrescriptionErrorCopyWith(PrescriptionError value, $Res Function(PrescriptionError) _then) = _$PrescriptionErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$PrescriptionErrorCopyWithImpl<$Res>
    implements $PrescriptionErrorCopyWith<$Res> {
  _$PrescriptionErrorCopyWithImpl(this._self, this._then);

  final PrescriptionError _self;
  final $Res Function(PrescriptionError) _then;

/// Create a copy of PrescriptionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(PrescriptionError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
