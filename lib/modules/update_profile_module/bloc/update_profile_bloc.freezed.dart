// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateProfileEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileEvent()';
}


}

/// @nodoc
class $UpdateProfileEventCopyWith<$Res>  {
$UpdateProfileEventCopyWith(UpdateProfileEvent _, $Res Function(UpdateProfileEvent) __);
}


/// Adds pattern-matching-related methods to [UpdateProfileEvent].
extension UpdateProfileEventPatterns on UpdateProfileEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _UpdatingDoctorProfile value)?  updatingDoctorProfile,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdatingDoctorProfile() when updatingDoctorProfile != null:
return updatingDoctorProfile(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _UpdatingDoctorProfile value)  updatingDoctorProfile,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _UpdatingDoctorProfile():
return updatingDoctorProfile(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _UpdatingDoctorProfile value)?  updatingDoctorProfile,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _UpdatingDoctorProfile() when updatingDoctorProfile != null:
return updatingDoctorProfile(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( UpdateProfileData updateProfileData)?  updatingDoctorProfile,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpdatingDoctorProfile() when updatingDoctorProfile != null:
return updatingDoctorProfile(_that.updateProfileData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( UpdateProfileData updateProfileData)  updatingDoctorProfile,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _UpdatingDoctorProfile():
return updatingDoctorProfile(_that.updateProfileData);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( UpdateProfileData updateProfileData)?  updatingDoctorProfile,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _UpdatingDoctorProfile() when updatingDoctorProfile != null:
return updatingDoctorProfile(_that.updateProfileData);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements UpdateProfileEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileEvent.started()';
}


}




/// @nodoc


class _UpdatingDoctorProfile implements UpdateProfileEvent {
  const _UpdatingDoctorProfile(this.updateProfileData);
  

 final  UpdateProfileData updateProfileData;

/// Create a copy of UpdateProfileEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatingDoctorProfileCopyWith<_UpdatingDoctorProfile> get copyWith => __$UpdatingDoctorProfileCopyWithImpl<_UpdatingDoctorProfile>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatingDoctorProfile&&(identical(other.updateProfileData, updateProfileData) || other.updateProfileData == updateProfileData));
}


@override
int get hashCode => Object.hash(runtimeType,updateProfileData);

@override
String toString() {
  return 'UpdateProfileEvent.updatingDoctorProfile(updateProfileData: $updateProfileData)';
}


}

/// @nodoc
abstract mixin class _$UpdatingDoctorProfileCopyWith<$Res> implements $UpdateProfileEventCopyWith<$Res> {
  factory _$UpdatingDoctorProfileCopyWith(_UpdatingDoctorProfile value, $Res Function(_UpdatingDoctorProfile) _then) = __$UpdatingDoctorProfileCopyWithImpl;
@useResult
$Res call({
 UpdateProfileData updateProfileData
});




}
/// @nodoc
class __$UpdatingDoctorProfileCopyWithImpl<$Res>
    implements _$UpdatingDoctorProfileCopyWith<$Res> {
  __$UpdatingDoctorProfileCopyWithImpl(this._self, this._then);

  final _UpdatingDoctorProfile _self;
  final $Res Function(_UpdatingDoctorProfile) _then;

/// Create a copy of UpdateProfileEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updateProfileData = null,}) {
  return _then(_UpdatingDoctorProfile(
null == updateProfileData ? _self.updateProfileData : updateProfileData // ignore: cast_nullable_to_non_nullable
as UpdateProfileData,
  ));
}


}

/// @nodoc
mixin _$UpdateProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileState()';
}


}

/// @nodoc
class $UpdateProfileStateCopyWith<$Res>  {
$UpdateProfileStateCopyWith(UpdateProfileState _, $Res Function(UpdateProfileState) __);
}


/// Adds pattern-matching-related methods to [UpdateProfileState].
extension UpdateProfileStatePatterns on UpdateProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UpdateProfileInitial value)?  initial,TResult Function( UpdateProfileLoading value)?  loading,TResult Function( UpdateProfileSuccess value)?  success,TResult Function( UpdateProfileError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UpdateProfileInitial() when initial != null:
return initial(_that);case UpdateProfileLoading() when loading != null:
return loading(_that);case UpdateProfileSuccess() when success != null:
return success(_that);case UpdateProfileError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UpdateProfileInitial value)  initial,required TResult Function( UpdateProfileLoading value)  loading,required TResult Function( UpdateProfileSuccess value)  success,required TResult Function( UpdateProfileError value)  error,}){
final _that = this;
switch (_that) {
case UpdateProfileInitial():
return initial(_that);case UpdateProfileLoading():
return loading(_that);case UpdateProfileSuccess():
return success(_that);case UpdateProfileError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UpdateProfileInitial value)?  initial,TResult? Function( UpdateProfileLoading value)?  loading,TResult? Function( UpdateProfileSuccess value)?  success,TResult? Function( UpdateProfileError value)?  error,}){
final _that = this;
switch (_that) {
case UpdateProfileInitial() when initial != null:
return initial(_that);case UpdateProfileLoading() when loading != null:
return loading(_that);case UpdateProfileSuccess() when success != null:
return success(_that);case UpdateProfileError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DoctorProfileUpdateResponseModel response)?  success,TResult Function( String errorMessage)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UpdateProfileInitial() when initial != null:
return initial();case UpdateProfileLoading() when loading != null:
return loading();case UpdateProfileSuccess() when success != null:
return success(_that.response);case UpdateProfileError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DoctorProfileUpdateResponseModel response)  success,required TResult Function( String errorMessage)  error,}) {final _that = this;
switch (_that) {
case UpdateProfileInitial():
return initial();case UpdateProfileLoading():
return loading();case UpdateProfileSuccess():
return success(_that.response);case UpdateProfileError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DoctorProfileUpdateResponseModel response)?  success,TResult? Function( String errorMessage)?  error,}) {final _that = this;
switch (_that) {
case UpdateProfileInitial() when initial != null:
return initial();case UpdateProfileLoading() when loading != null:
return loading();case UpdateProfileSuccess() when success != null:
return success(_that.response);case UpdateProfileError() when error != null:
return error(_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class UpdateProfileInitial implements UpdateProfileState {
  const UpdateProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileState.initial()';
}


}




/// @nodoc


class UpdateProfileLoading implements UpdateProfileState {
  const UpdateProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UpdateProfileState.loading()';
}


}




/// @nodoc


class UpdateProfileSuccess implements UpdateProfileState {
  const UpdateProfileSuccess(this.response);
  

 final  DoctorProfileUpdateResponseModel response;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileSuccessCopyWith<UpdateProfileSuccess> get copyWith => _$UpdateProfileSuccessCopyWithImpl<UpdateProfileSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'UpdateProfileState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileSuccessCopyWith<$Res> implements $UpdateProfileStateCopyWith<$Res> {
  factory $UpdateProfileSuccessCopyWith(UpdateProfileSuccess value, $Res Function(UpdateProfileSuccess) _then) = _$UpdateProfileSuccessCopyWithImpl;
@useResult
$Res call({
 DoctorProfileUpdateResponseModel response
});




}
/// @nodoc
class _$UpdateProfileSuccessCopyWithImpl<$Res>
    implements $UpdateProfileSuccessCopyWith<$Res> {
  _$UpdateProfileSuccessCopyWithImpl(this._self, this._then);

  final UpdateProfileSuccess _self;
  final $Res Function(UpdateProfileSuccess) _then;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(UpdateProfileSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as DoctorProfileUpdateResponseModel,
  ));
}


}

/// @nodoc


class UpdateProfileError implements UpdateProfileState {
  const UpdateProfileError(this.errorMessage);
  

 final  String errorMessage;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileErrorCopyWith<UpdateProfileError> get copyWith => _$UpdateProfileErrorCopyWithImpl<UpdateProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileError&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,errorMessage);

@override
String toString() {
  return 'UpdateProfileState.error(errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileErrorCopyWith<$Res> implements $UpdateProfileStateCopyWith<$Res> {
  factory $UpdateProfileErrorCopyWith(UpdateProfileError value, $Res Function(UpdateProfileError) _then) = _$UpdateProfileErrorCopyWithImpl;
@useResult
$Res call({
 String errorMessage
});




}
/// @nodoc
class _$UpdateProfileErrorCopyWithImpl<$Res>
    implements $UpdateProfileErrorCopyWith<$Res> {
  _$UpdateProfileErrorCopyWithImpl(this._self, this._then);

  final UpdateProfileError _self;
  final $Res Function(UpdateProfileError) _then;

/// Create a copy of UpdateProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? errorMessage = null,}) {
  return _then(UpdateProfileError(
null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
