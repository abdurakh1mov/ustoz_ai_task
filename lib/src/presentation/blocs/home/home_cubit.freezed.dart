// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 List<TransactionModel?> get userTransactions; bool get isLoading; RateModel? get rate; UserModel? get userData; String get selectedDate; String get selectedCategory; DateTime? get startDate; DateTime? get endDate; bool? get isIncome; bool get isFiltered; bool? get isUsd; List<CategoryModel> get categories; List<CategoryModel> get categoriesIncome; List<String> get typesList; List<String> get staticDatesList;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.userTransactions, userTransactions)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.userData, userData) || other.userData == userData)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isIncome, isIncome) || other.isIncome == isIncome)&&(identical(other.isFiltered, isFiltered) || other.isFiltered == isFiltered)&&(identical(other.isUsd, isUsd) || other.isUsd == isUsd)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.categoriesIncome, categoriesIncome)&&const DeepCollectionEquality().equals(other.typesList, typesList)&&const DeepCollectionEquality().equals(other.staticDatesList, staticDatesList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(userTransactions),isLoading,rate,userData,selectedDate,selectedCategory,startDate,endDate,isIncome,isFiltered,isUsd,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(categoriesIncome),const DeepCollectionEquality().hash(typesList),const DeepCollectionEquality().hash(staticDatesList));

@override
String toString() {
  return 'HomeState(userTransactions: $userTransactions, isLoading: $isLoading, rate: $rate, userData: $userData, selectedDate: $selectedDate, selectedCategory: $selectedCategory, startDate: $startDate, endDate: $endDate, isIncome: $isIncome, isFiltered: $isFiltered, isUsd: $isUsd, categories: $categories, categoriesIncome: $categoriesIncome, typesList: $typesList, staticDatesList: $staticDatesList)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<TransactionModel?> userTransactions, bool isLoading, RateModel? rate, UserModel? userData, String selectedDate, String selectedCategory, DateTime? startDate, DateTime? endDate, bool? isIncome, bool isFiltered, bool? isUsd, List<CategoryModel> categories, List<CategoryModel> categoriesIncome, List<String> typesList, List<String> staticDatesList
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userTransactions = null,Object? isLoading = null,Object? rate = freezed,Object? userData = freezed,Object? selectedDate = null,Object? selectedCategory = null,Object? startDate = freezed,Object? endDate = freezed,Object? isIncome = freezed,Object? isFiltered = null,Object? isUsd = freezed,Object? categories = null,Object? categoriesIncome = null,Object? typesList = null,Object? staticDatesList = null,}) {
  return _then(_self.copyWith(
userTransactions: null == userTransactions ? _self.userTransactions : userTransactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel?>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as RateModel?,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserModel?,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as String,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isIncome: freezed == isIncome ? _self.isIncome : isIncome // ignore: cast_nullable_to_non_nullable
as bool?,isFiltered: null == isFiltered ? _self.isFiltered : isFiltered // ignore: cast_nullable_to_non_nullable
as bool,isUsd: freezed == isUsd ? _self.isUsd : isUsd // ignore: cast_nullable_to_non_nullable
as bool?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,categoriesIncome: null == categoriesIncome ? _self.categoriesIncome : categoriesIncome // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,typesList: null == typesList ? _self.typesList : typesList // ignore: cast_nullable_to_non_nullable
as List<String>,staticDatesList: null == staticDatesList ? _self.staticDatesList : staticDatesList // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TransactionModel?> userTransactions,  bool isLoading,  RateModel? rate,  UserModel? userData,  String selectedDate,  String selectedCategory,  DateTime? startDate,  DateTime? endDate,  bool? isIncome,  bool isFiltered,  bool? isUsd,  List<CategoryModel> categories,  List<CategoryModel> categoriesIncome,  List<String> typesList,  List<String> staticDatesList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.userTransactions,_that.isLoading,_that.rate,_that.userData,_that.selectedDate,_that.selectedCategory,_that.startDate,_that.endDate,_that.isIncome,_that.isFiltered,_that.isUsd,_that.categories,_that.categoriesIncome,_that.typesList,_that.staticDatesList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TransactionModel?> userTransactions,  bool isLoading,  RateModel? rate,  UserModel? userData,  String selectedDate,  String selectedCategory,  DateTime? startDate,  DateTime? endDate,  bool? isIncome,  bool isFiltered,  bool? isUsd,  List<CategoryModel> categories,  List<CategoryModel> categoriesIncome,  List<String> typesList,  List<String> staticDatesList)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.userTransactions,_that.isLoading,_that.rate,_that.userData,_that.selectedDate,_that.selectedCategory,_that.startDate,_that.endDate,_that.isIncome,_that.isFiltered,_that.isUsd,_that.categories,_that.categoriesIncome,_that.typesList,_that.staticDatesList);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TransactionModel?> userTransactions,  bool isLoading,  RateModel? rate,  UserModel? userData,  String selectedDate,  String selectedCategory,  DateTime? startDate,  DateTime? endDate,  bool? isIncome,  bool isFiltered,  bool? isUsd,  List<CategoryModel> categories,  List<CategoryModel> categoriesIncome,  List<String> typesList,  List<String> staticDatesList)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.userTransactions,_that.isLoading,_that.rate,_that.userData,_that.selectedDate,_that.selectedCategory,_that.startDate,_that.endDate,_that.isIncome,_that.isFiltered,_that.isUsd,_that.categories,_that.categoriesIncome,_that.typesList,_that.staticDatesList);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({final  List<TransactionModel?> userTransactions = const [], this.isLoading = false, this.rate = null, this.userData = null, this.selectedDate = "", this.selectedCategory = "", this.startDate = null, this.endDate = null, this.isIncome = null, this.isFiltered = false, this.isUsd = null, final  List<CategoryModel> categories = const [], final  List<CategoryModel> categoriesIncome = const [], final  List<String> typesList = const [], final  List<String> staticDatesList = const []}): _userTransactions = userTransactions,_categories = categories,_categoriesIncome = categoriesIncome,_typesList = typesList,_staticDatesList = staticDatesList;
  

 final  List<TransactionModel?> _userTransactions;
@override@JsonKey() List<TransactionModel?> get userTransactions {
  if (_userTransactions is EqualUnmodifiableListView) return _userTransactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userTransactions);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  RateModel? rate;
@override@JsonKey() final  UserModel? userData;
@override@JsonKey() final  String selectedDate;
@override@JsonKey() final  String selectedCategory;
@override@JsonKey() final  DateTime? startDate;
@override@JsonKey() final  DateTime? endDate;
@override@JsonKey() final  bool? isIncome;
@override@JsonKey() final  bool isFiltered;
@override@JsonKey() final  bool? isUsd;
 final  List<CategoryModel> _categories;
@override@JsonKey() List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<CategoryModel> _categoriesIncome;
@override@JsonKey() List<CategoryModel> get categoriesIncome {
  if (_categoriesIncome is EqualUnmodifiableListView) return _categoriesIncome;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoriesIncome);
}

 final  List<String> _typesList;
@override@JsonKey() List<String> get typesList {
  if (_typesList is EqualUnmodifiableListView) return _typesList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_typesList);
}

 final  List<String> _staticDatesList;
@override@JsonKey() List<String> get staticDatesList {
  if (_staticDatesList is EqualUnmodifiableListView) return _staticDatesList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_staticDatesList);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._userTransactions, _userTransactions)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.userData, userData) || other.userData == userData)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isIncome, isIncome) || other.isIncome == isIncome)&&(identical(other.isFiltered, isFiltered) || other.isFiltered == isFiltered)&&(identical(other.isUsd, isUsd) || other.isUsd == isUsd)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._categoriesIncome, _categoriesIncome)&&const DeepCollectionEquality().equals(other._typesList, _typesList)&&const DeepCollectionEquality().equals(other._staticDatesList, _staticDatesList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_userTransactions),isLoading,rate,userData,selectedDate,selectedCategory,startDate,endDate,isIncome,isFiltered,isUsd,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_categoriesIncome),const DeepCollectionEquality().hash(_typesList),const DeepCollectionEquality().hash(_staticDatesList));

@override
String toString() {
  return 'HomeState(userTransactions: $userTransactions, isLoading: $isLoading, rate: $rate, userData: $userData, selectedDate: $selectedDate, selectedCategory: $selectedCategory, startDate: $startDate, endDate: $endDate, isIncome: $isIncome, isFiltered: $isFiltered, isUsd: $isUsd, categories: $categories, categoriesIncome: $categoriesIncome, typesList: $typesList, staticDatesList: $staticDatesList)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<TransactionModel?> userTransactions, bool isLoading, RateModel? rate, UserModel? userData, String selectedDate, String selectedCategory, DateTime? startDate, DateTime? endDate, bool? isIncome, bool isFiltered, bool? isUsd, List<CategoryModel> categories, List<CategoryModel> categoriesIncome, List<String> typesList, List<String> staticDatesList
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userTransactions = null,Object? isLoading = null,Object? rate = freezed,Object? userData = freezed,Object? selectedDate = null,Object? selectedCategory = null,Object? startDate = freezed,Object? endDate = freezed,Object? isIncome = freezed,Object? isFiltered = null,Object? isUsd = freezed,Object? categories = null,Object? categoriesIncome = null,Object? typesList = null,Object? staticDatesList = null,}) {
  return _then(_HomeState(
userTransactions: null == userTransactions ? _self._userTransactions : userTransactions // ignore: cast_nullable_to_non_nullable
as List<TransactionModel?>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as RateModel?,userData: freezed == userData ? _self.userData : userData // ignore: cast_nullable_to_non_nullable
as UserModel?,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as String,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isIncome: freezed == isIncome ? _self.isIncome : isIncome // ignore: cast_nullable_to_non_nullable
as bool?,isFiltered: null == isFiltered ? _self.isFiltered : isFiltered // ignore: cast_nullable_to_non_nullable
as bool,isUsd: freezed == isUsd ? _self.isUsd : isUsd // ignore: cast_nullable_to_non_nullable
as bool?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,categoriesIncome: null == categoriesIncome ? _self._categoriesIncome : categoriesIncome // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,typesList: null == typesList ? _self._typesList : typesList // ignore: cast_nullable_to_non_nullable
as List<String>,staticDatesList: null == staticDatesList ? _self._staticDatesList : staticDatesList // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
