// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'available_time_slots_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AvailableTimeSlotsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableTimeSlotsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AvailableTimeSlotsState()';
}


}

/// @nodoc
class $AvailableTimeSlotsStateCopyWith<$Res>  {
$AvailableTimeSlotsStateCopyWith(AvailableTimeSlotsState _, $Res Function(AvailableTimeSlotsState) __);
}


/// Adds pattern-matching-related methods to [AvailableTimeSlotsState].
extension AvailableTimeSlotsStatePatterns on AvailableTimeSlotsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AvailableTimeSlotsInitial value)?  initial,TResult Function( AvailableTimeSlotsLoading value)?  loading,TResult Function( AvailableTimeSlotsLoaded value)?  loaded,TResult Function( AvailableTimeSlotsError value)?  error,TResult Function( AvailableTimeSlotsEmpty value)?  empty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AvailableTimeSlotsInitial() when initial != null:
return initial(_that);case AvailableTimeSlotsLoading() when loading != null:
return loading(_that);case AvailableTimeSlotsLoaded() when loaded != null:
return loaded(_that);case AvailableTimeSlotsError() when error != null:
return error(_that);case AvailableTimeSlotsEmpty() when empty != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AvailableTimeSlotsInitial value)  initial,required TResult Function( AvailableTimeSlotsLoading value)  loading,required TResult Function( AvailableTimeSlotsLoaded value)  loaded,required TResult Function( AvailableTimeSlotsError value)  error,required TResult Function( AvailableTimeSlotsEmpty value)  empty,}){
final _that = this;
switch (_that) {
case AvailableTimeSlotsInitial():
return initial(_that);case AvailableTimeSlotsLoading():
return loading(_that);case AvailableTimeSlotsLoaded():
return loaded(_that);case AvailableTimeSlotsError():
return error(_that);case AvailableTimeSlotsEmpty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AvailableTimeSlotsInitial value)?  initial,TResult? Function( AvailableTimeSlotsLoading value)?  loading,TResult? Function( AvailableTimeSlotsLoaded value)?  loaded,TResult? Function( AvailableTimeSlotsError value)?  error,TResult? Function( AvailableTimeSlotsEmpty value)?  empty,}){
final _that = this;
switch (_that) {
case AvailableTimeSlotsInitial() when initial != null:
return initial(_that);case AvailableTimeSlotsLoading() when loading != null:
return loading(_that);case AvailableTimeSlotsLoaded() when loaded != null:
return loaded(_that);case AvailableTimeSlotsError() when error != null:
return error(_that);case AvailableTimeSlotsEmpty() when empty != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AvailableSlotsModel availableSlotsModel)?  loaded,TResult Function( String error)?  error,TResult Function()?  empty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AvailableTimeSlotsInitial() when initial != null:
return initial();case AvailableTimeSlotsLoading() when loading != null:
return loading();case AvailableTimeSlotsLoaded() when loaded != null:
return loaded(_that.availableSlotsModel);case AvailableTimeSlotsError() when error != null:
return error(_that.error);case AvailableTimeSlotsEmpty() when empty != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AvailableSlotsModel availableSlotsModel)  loaded,required TResult Function( String error)  error,required TResult Function()  empty,}) {final _that = this;
switch (_that) {
case AvailableTimeSlotsInitial():
return initial();case AvailableTimeSlotsLoading():
return loading();case AvailableTimeSlotsLoaded():
return loaded(_that.availableSlotsModel);case AvailableTimeSlotsError():
return error(_that.error);case AvailableTimeSlotsEmpty():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AvailableSlotsModel availableSlotsModel)?  loaded,TResult? Function( String error)?  error,TResult? Function()?  empty,}) {final _that = this;
switch (_that) {
case AvailableTimeSlotsInitial() when initial != null:
return initial();case AvailableTimeSlotsLoading() when loading != null:
return loading();case AvailableTimeSlotsLoaded() when loaded != null:
return loaded(_that.availableSlotsModel);case AvailableTimeSlotsError() when error != null:
return error(_that.error);case AvailableTimeSlotsEmpty() when empty != null:
return empty();case _:
  return null;

}
}

}

/// @nodoc


class AvailableTimeSlotsInitial implements AvailableTimeSlotsState {
  const AvailableTimeSlotsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableTimeSlotsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AvailableTimeSlotsState.initial()';
}


}




/// @nodoc


class AvailableTimeSlotsLoading implements AvailableTimeSlotsState {
  const AvailableTimeSlotsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableTimeSlotsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AvailableTimeSlotsState.loading()';
}


}




/// @nodoc


class AvailableTimeSlotsLoaded implements AvailableTimeSlotsState {
  const AvailableTimeSlotsLoaded(this.availableSlotsModel);
  

 final  AvailableSlotsModel availableSlotsModel;

/// Create a copy of AvailableTimeSlotsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableTimeSlotsLoadedCopyWith<AvailableTimeSlotsLoaded> get copyWith => _$AvailableTimeSlotsLoadedCopyWithImpl<AvailableTimeSlotsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableTimeSlotsLoaded&&(identical(other.availableSlotsModel, availableSlotsModel) || other.availableSlotsModel == availableSlotsModel));
}


@override
int get hashCode => Object.hash(runtimeType,availableSlotsModel);

@override
String toString() {
  return 'AvailableTimeSlotsState.loaded(availableSlotsModel: $availableSlotsModel)';
}


}

/// @nodoc
abstract mixin class $AvailableTimeSlotsLoadedCopyWith<$Res> implements $AvailableTimeSlotsStateCopyWith<$Res> {
  factory $AvailableTimeSlotsLoadedCopyWith(AvailableTimeSlotsLoaded value, $Res Function(AvailableTimeSlotsLoaded) _then) = _$AvailableTimeSlotsLoadedCopyWithImpl;
@useResult
$Res call({
 AvailableSlotsModel availableSlotsModel
});




}
/// @nodoc
class _$AvailableTimeSlotsLoadedCopyWithImpl<$Res>
    implements $AvailableTimeSlotsLoadedCopyWith<$Res> {
  _$AvailableTimeSlotsLoadedCopyWithImpl(this._self, this._then);

  final AvailableTimeSlotsLoaded _self;
  final $Res Function(AvailableTimeSlotsLoaded) _then;

/// Create a copy of AvailableTimeSlotsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? availableSlotsModel = null,}) {
  return _then(AvailableTimeSlotsLoaded(
null == availableSlotsModel ? _self.availableSlotsModel : availableSlotsModel // ignore: cast_nullable_to_non_nullable
as AvailableSlotsModel,
  ));
}


}

/// @nodoc


class AvailableTimeSlotsError implements AvailableTimeSlotsState {
  const AvailableTimeSlotsError(this.error);
  

 final  String error;

/// Create a copy of AvailableTimeSlotsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailableTimeSlotsErrorCopyWith<AvailableTimeSlotsError> get copyWith => _$AvailableTimeSlotsErrorCopyWithImpl<AvailableTimeSlotsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableTimeSlotsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'AvailableTimeSlotsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $AvailableTimeSlotsErrorCopyWith<$Res> implements $AvailableTimeSlotsStateCopyWith<$Res> {
  factory $AvailableTimeSlotsErrorCopyWith(AvailableTimeSlotsError value, $Res Function(AvailableTimeSlotsError) _then) = _$AvailableTimeSlotsErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$AvailableTimeSlotsErrorCopyWithImpl<$Res>
    implements $AvailableTimeSlotsErrorCopyWith<$Res> {
  _$AvailableTimeSlotsErrorCopyWithImpl(this._self, this._then);

  final AvailableTimeSlotsError _self;
  final $Res Function(AvailableTimeSlotsError) _then;

/// Create a copy of AvailableTimeSlotsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AvailableTimeSlotsError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AvailableTimeSlotsEmpty implements AvailableTimeSlotsState {
  const AvailableTimeSlotsEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailableTimeSlotsEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AvailableTimeSlotsState.empty()';
}


}




// dart format on
