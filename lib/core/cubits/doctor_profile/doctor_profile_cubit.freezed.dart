// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DoctorProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorProfileState()';
}


}

/// @nodoc
class $DoctorProfileStateCopyWith<$Res>  {
$DoctorProfileStateCopyWith(DoctorProfileState _, $Res Function(DoctorProfileState) __);
}


/// Adds pattern-matching-related methods to [DoctorProfileState].
extension DoctorProfileStatePatterns on DoctorProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DoctorProfileInitial value)?  initial,TResult Function( DoctorProfileLoading value)?  loading,TResult Function( DoctorProfileSuccess value)?  success,TResult Function( DoctorProfileError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DoctorProfileInitial() when initial != null:
return initial(_that);case DoctorProfileLoading() when loading != null:
return loading(_that);case DoctorProfileSuccess() when success != null:
return success(_that);case DoctorProfileError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DoctorProfileInitial value)  initial,required TResult Function( DoctorProfileLoading value)  loading,required TResult Function( DoctorProfileSuccess value)  success,required TResult Function( DoctorProfileError value)  error,}){
final _that = this;
switch (_that) {
case DoctorProfileInitial():
return initial(_that);case DoctorProfileLoading():
return loading(_that);case DoctorProfileSuccess():
return success(_that);case DoctorProfileError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DoctorProfileInitial value)?  initial,TResult? Function( DoctorProfileLoading value)?  loading,TResult? Function( DoctorProfileSuccess value)?  success,TResult? Function( DoctorProfileError value)?  error,}){
final _that = this;
switch (_that) {
case DoctorProfileInitial() when initial != null:
return initial(_that);case DoctorProfileLoading() when loading != null:
return loading(_that);case DoctorProfileSuccess() when success != null:
return success(_that);case DoctorProfileError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DoctorProfileModel profileData)?  success,TResult Function( String errorMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DoctorProfileInitial() when initial != null:
return initial();case DoctorProfileLoading() when loading != null:
return loading();case DoctorProfileSuccess() when success != null:
return success(_that.profileData);case DoctorProfileError() when error != null:
return error(_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DoctorProfileModel profileData)  success,required TResult Function( String errorMessage)  error,}) {final _that = this;
switch (_that) {
case DoctorProfileInitial():
return initial();case DoctorProfileLoading():
return loading();case DoctorProfileSuccess():
return success(_that.profileData);case DoctorProfileError():
return error(_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DoctorProfileModel profileData)?  success,TResult? Function( String errorMessage)?  error,}) {final _that = this;
switch (_that) {
case DoctorProfileInitial() when initial != null:
return initial();case DoctorProfileLoading() when loading != null:
return loading();case DoctorProfileSuccess() when success != null:
return success(_that.profileData);case DoctorProfileError() when error != null:
return error(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class DoctorProfileInitial implements DoctorProfileState {
  const DoctorProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorProfileState.initial()';
}


}




/// @nodoc


class DoctorProfileLoading implements DoctorProfileState {
  const DoctorProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DoctorProfileState.loading()';
}


}




/// @nodoc


class DoctorProfileSuccess implements DoctorProfileState {
  const DoctorProfileSuccess({required this.profileData});
  

 final  DoctorProfileModel profileData;

/// Create a copy of DoctorProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorProfileSuccessCopyWith<DoctorProfileSuccess> get copyWith => _$DoctorProfileSuccessCopyWithImpl<DoctorProfileSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorProfileSuccess&&(identical(other.profileData, profileData) || other.profileData == profileData));
}


@override
int get hashCode => Object.hash(runtimeType,profileData);

@override
String toString() {
  return 'DoctorProfileState.success(profileData: $profileData)';
}


}

/// @nodoc
abstract mixin class $DoctorProfileSuccessCopyWith<$Res> implements $DoctorProfileStateCopyWith<$Res> {
  factory $DoctorProfileSuccessCopyWith(DoctorProfileSuccess value, $Res Function(DoctorProfileSuccess) _then) = _$DoctorProfileSuccessCopyWithImpl;
@useResult
$Res call({
 DoctorProfileModel profileData
});




}
/// @nodoc
class _$DoctorProfileSuccessCopyWithImpl<$Res>
    implements $DoctorProfileSuccessCopyWith<$Res> {
  _$DoctorProfileSuccessCopyWithImpl(this._self, this._then);

  final DoctorProfileSuccess _self;
  final $Res Function(DoctorProfileSuccess) _then;

/// Create a copy of DoctorProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profileData = null,}) {
  return _then(DoctorProfileSuccess(
profileData: null == profileData ? _self.profileData : profileData // ignore: cast_nullable_to_non_nullable
as DoctorProfileModel,
  ));
}


}

/// @nodoc


class DoctorProfileError implements DoctorProfileState {
  const DoctorProfileError({required this.errorMessage});
  

 final  String errorMessage;

/// Create a copy of DoctorProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoctorProfileErrorCopyWith<DoctorProfileError> get copyWith => _$DoctorProfileErrorCopyWithImpl<DoctorProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoctorProfileError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'DoctorProfileState.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DoctorProfileErrorCopyWith<$Res> implements $DoctorProfileStateCopyWith<$Res> {
  factory $DoctorProfileErrorCopyWith(DoctorProfileError value, $Res Function(DoctorProfileError) _then) = _$DoctorProfileErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$DoctorProfileErrorCopyWithImpl<$Res>
    implements $DoctorProfileErrorCopyWith<$Res> {
  _$DoctorProfileErrorCopyWithImpl(this._self, this._then);

  final DoctorProfileError _self;
  final $Res Function(DoctorProfileError) _then;

/// Create a copy of DoctorProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(DoctorProfileError(
errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
