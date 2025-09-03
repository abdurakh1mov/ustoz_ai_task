// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_transaction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateTransactionState {

 bool get isLoading; bool get isCreatingLoading; bool get isSuccess; String? get errorMessage; List<CategoryModel> get categories; List<CategoryModel> get categoriesIncome;
/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransactionStateCopyWith<CreateTransactionState> get copyWith => _$CreateTransactionStateCopyWithImpl<CreateTransactionState>(this as CreateTransactionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransactionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCreatingLoading, isCreatingLoading) || other.isCreatingLoading == isCreatingLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.categoriesIncome, categoriesIncome));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isCreatingLoading,isSuccess,errorMessage,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(categoriesIncome));

@override
String toString() {
  return 'CreateTransactionState(isLoading: $isLoading, isCreatingLoading: $isCreatingLoading, isSuccess: $isSuccess, errorMessage: $errorMessage, categories: $categories, categoriesIncome: $categoriesIncome)';
}


}

/// @nodoc
abstract mixin class $CreateTransactionStateCopyWith<$Res>  {
  factory $CreateTransactionStateCopyWith(CreateTransactionState value, $Res Function(CreateTransactionState) _then) = _$CreateTransactionStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isCreatingLoading, bool isSuccess, String? errorMessage, List<CategoryModel> categories, List<CategoryModel> categoriesIncome
});




}
/// @nodoc
class _$CreateTransactionStateCopyWithImpl<$Res>
    implements $CreateTransactionStateCopyWith<$Res> {
  _$CreateTransactionStateCopyWithImpl(this._self, this._then);

  final CreateTransactionState _self;
  final $Res Function(CreateTransactionState) _then;

/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isCreatingLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,Object? categories = null,Object? categoriesIncome = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCreatingLoading: null == isCreatingLoading ? _self.isCreatingLoading : isCreatingLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,categoriesIncome: null == categoriesIncome ? _self.categoriesIncome : categoriesIncome // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTransactionState].
extension CreateTransactionStatePatterns on CreateTransactionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTransactionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransactionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTransactionState value)  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTransactionState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTransactionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isCreatingLoading,  bool isSuccess,  String? errorMessage,  List<CategoryModel> categories,  List<CategoryModel> categoriesIncome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransactionState() when $default != null:
return $default(_that.isLoading,_that.isCreatingLoading,_that.isSuccess,_that.errorMessage,_that.categories,_that.categoriesIncome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isCreatingLoading,  bool isSuccess,  String? errorMessage,  List<CategoryModel> categories,  List<CategoryModel> categoriesIncome)  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionState():
return $default(_that.isLoading,_that.isCreatingLoading,_that.isSuccess,_that.errorMessage,_that.categories,_that.categoriesIncome);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isCreatingLoading,  bool isSuccess,  String? errorMessage,  List<CategoryModel> categories,  List<CategoryModel> categoriesIncome)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionState() when $default != null:
return $default(_that.isLoading,_that.isCreatingLoading,_that.isSuccess,_that.errorMessage,_that.categories,_that.categoriesIncome);case _:
  return null;

}
}

}

/// @nodoc


class _CreateTransactionState implements CreateTransactionState {
  const _CreateTransactionState({this.isLoading = false, this.isCreatingLoading = false, this.isSuccess = false, this.errorMessage, final  List<CategoryModel> categories = const [], final  List<CategoryModel> categoriesIncome = const []}): _categories = categories,_categoriesIncome = categoriesIncome;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isCreatingLoading;
@override@JsonKey() final  bool isSuccess;
@override final  String? errorMessage;
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


/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionStateCopyWith<_CreateTransactionState> get copyWith => __$CreateTransactionStateCopyWithImpl<_CreateTransactionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCreatingLoading, isCreatingLoading) || other.isCreatingLoading == isCreatingLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._categoriesIncome, _categoriesIncome));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isCreatingLoading,isSuccess,errorMessage,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_categoriesIncome));

@override
String toString() {
  return 'CreateTransactionState(isLoading: $isLoading, isCreatingLoading: $isCreatingLoading, isSuccess: $isSuccess, errorMessage: $errorMessage, categories: $categories, categoriesIncome: $categoriesIncome)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionStateCopyWith<$Res> implements $CreateTransactionStateCopyWith<$Res> {
  factory _$CreateTransactionStateCopyWith(_CreateTransactionState value, $Res Function(_CreateTransactionState) _then) = __$CreateTransactionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isCreatingLoading, bool isSuccess, String? errorMessage, List<CategoryModel> categories, List<CategoryModel> categoriesIncome
});




}
/// @nodoc
class __$CreateTransactionStateCopyWithImpl<$Res>
    implements _$CreateTransactionStateCopyWith<$Res> {
  __$CreateTransactionStateCopyWithImpl(this._self, this._then);

  final _CreateTransactionState _self;
  final $Res Function(_CreateTransactionState) _then;

/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isCreatingLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,Object? categories = null,Object? categoriesIncome = null,}) {
  return _then(_CreateTransactionState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCreatingLoading: null == isCreatingLoading ? _self.isCreatingLoading : isCreatingLoading // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,categoriesIncome: null == categoriesIncome ? _self._categoriesIncome : categoriesIncome // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}


}

/// @nodoc
mixin _$CreateTransactionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransactionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateTransactionEvent()';
}


}

/// @nodoc
class $CreateTransactionEventCopyWith<$Res>  {
$CreateTransactionEventCopyWith(CreateTransactionEvent _, $Res Function(CreateTransactionEvent) __);
}


/// Adds pattern-matching-related methods to [CreateTransactionEvent].
extension CreateTransactionEventPatterns on CreateTransactionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateTransactionEvent value)?  createTransaction,TResult Function( _FetchCategories value)?  fetchCategories,TResult Function( _ChangeOverallSums value)?  changeOverallSums,TResult Function( _FetchCategoriesIncome value)?  fetchCategoriesIncome,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransactionEvent() when createTransaction != null:
return createTransaction(_that);case _FetchCategories() when fetchCategories != null:
return fetchCategories(_that);case _ChangeOverallSums() when changeOverallSums != null:
return changeOverallSums(_that);case _FetchCategoriesIncome() when fetchCategoriesIncome != null:
return fetchCategoriesIncome(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateTransactionEvent value)  createTransaction,required TResult Function( _FetchCategories value)  fetchCategories,required TResult Function( _ChangeOverallSums value)  changeOverallSums,required TResult Function( _FetchCategoriesIncome value)  fetchCategoriesIncome,}){
final _that = this;
switch (_that) {
case _CreateTransactionEvent():
return createTransaction(_that);case _FetchCategories():
return fetchCategories(_that);case _ChangeOverallSums():
return changeOverallSums(_that);case _FetchCategoriesIncome():
return fetchCategoriesIncome(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateTransactionEvent value)?  createTransaction,TResult? Function( _FetchCategories value)?  fetchCategories,TResult? Function( _ChangeOverallSums value)?  changeOverallSums,TResult? Function( _FetchCategoriesIncome value)?  fetchCategoriesIncome,}){
final _that = this;
switch (_that) {
case _CreateTransactionEvent() when createTransaction != null:
return createTransaction(_that);case _FetchCategories() when fetchCategories != null:
return fetchCategories(_that);case _ChangeOverallSums() when changeOverallSums != null:
return changeOverallSums(_that);case _FetchCategoriesIncome() when fetchCategoriesIncome != null:
return fetchCategoriesIncome(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String amount,  String note,  DateTime date,  CategoryModel category,  bool isIncome,  bool isUsd,  BuildContext context)?  createTransaction,TResult Function()?  fetchCategories,TResult Function( bool isIncome,  int amount,  int incomes,  int expenses,  bool isUsd)?  changeOverallSums,TResult Function()?  fetchCategoriesIncome,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransactionEvent() when createTransaction != null:
return createTransaction(_that.amount,_that.note,_that.date,_that.category,_that.isIncome,_that.isUsd,_that.context);case _FetchCategories() when fetchCategories != null:
return fetchCategories();case _ChangeOverallSums() when changeOverallSums != null:
return changeOverallSums(_that.isIncome,_that.amount,_that.incomes,_that.expenses,_that.isUsd);case _FetchCategoriesIncome() when fetchCategoriesIncome != null:
return fetchCategoriesIncome();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String amount,  String note,  DateTime date,  CategoryModel category,  bool isIncome,  bool isUsd,  BuildContext context)  createTransaction,required TResult Function()  fetchCategories,required TResult Function( bool isIncome,  int amount,  int incomes,  int expenses,  bool isUsd)  changeOverallSums,required TResult Function()  fetchCategoriesIncome,}) {final _that = this;
switch (_that) {
case _CreateTransactionEvent():
return createTransaction(_that.amount,_that.note,_that.date,_that.category,_that.isIncome,_that.isUsd,_that.context);case _FetchCategories():
return fetchCategories();case _ChangeOverallSums():
return changeOverallSums(_that.isIncome,_that.amount,_that.incomes,_that.expenses,_that.isUsd);case _FetchCategoriesIncome():
return fetchCategoriesIncome();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String amount,  String note,  DateTime date,  CategoryModel category,  bool isIncome,  bool isUsd,  BuildContext context)?  createTransaction,TResult? Function()?  fetchCategories,TResult? Function( bool isIncome,  int amount,  int incomes,  int expenses,  bool isUsd)?  changeOverallSums,TResult? Function()?  fetchCategoriesIncome,}) {final _that = this;
switch (_that) {
case _CreateTransactionEvent() when createTransaction != null:
return createTransaction(_that.amount,_that.note,_that.date,_that.category,_that.isIncome,_that.isUsd,_that.context);case _FetchCategories() when fetchCategories != null:
return fetchCategories();case _ChangeOverallSums() when changeOverallSums != null:
return changeOverallSums(_that.isIncome,_that.amount,_that.incomes,_that.expenses,_that.isUsd);case _FetchCategoriesIncome() when fetchCategoriesIncome != null:
return fetchCategoriesIncome();case _:
  return null;

}
}

}

/// @nodoc


class _CreateTransactionEvent implements CreateTransactionEvent {
  const _CreateTransactionEvent({required this.amount, required this.note, required this.date, required this.category, required this.isIncome, required this.isUsd, required this.context});
  

 final  String amount;
 final  String note;
 final  DateTime date;
 final  CategoryModel category;
 final  bool isIncome;
 final  bool isUsd;
 final  BuildContext context;

/// Create a copy of CreateTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionEventCopyWith<_CreateTransactionEvent> get copyWith => __$CreateTransactionEventCopyWithImpl<_CreateTransactionEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionEvent&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.note, note) || other.note == note)&&(identical(other.date, date) || other.date == date)&&(identical(other.category, category) || other.category == category)&&(identical(other.isIncome, isIncome) || other.isIncome == isIncome)&&(identical(other.isUsd, isUsd) || other.isUsd == isUsd)&&(identical(other.context, context) || other.context == context));
}


@override
int get hashCode => Object.hash(runtimeType,amount,note,date,category,isIncome,isUsd,context);

@override
String toString() {
  return 'CreateTransactionEvent.createTransaction(amount: $amount, note: $note, date: $date, category: $category, isIncome: $isIncome, isUsd: $isUsd, context: $context)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionEventCopyWith<$Res> implements $CreateTransactionEventCopyWith<$Res> {
  factory _$CreateTransactionEventCopyWith(_CreateTransactionEvent value, $Res Function(_CreateTransactionEvent) _then) = __$CreateTransactionEventCopyWithImpl;
@useResult
$Res call({
 String amount, String note, DateTime date, CategoryModel category, bool isIncome, bool isUsd, BuildContext context
});




}
/// @nodoc
class __$CreateTransactionEventCopyWithImpl<$Res>
    implements _$CreateTransactionEventCopyWith<$Res> {
  __$CreateTransactionEventCopyWithImpl(this._self, this._then);

  final _CreateTransactionEvent _self;
  final $Res Function(_CreateTransactionEvent) _then;

/// Create a copy of CreateTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? note = null,Object? date = null,Object? category = null,Object? isIncome = null,Object? isUsd = null,Object? context = null,}) {
  return _then(_CreateTransactionEvent(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryModel,isIncome: null == isIncome ? _self.isIncome : isIncome // ignore: cast_nullable_to_non_nullable
as bool,isUsd: null == isUsd ? _self.isUsd : isUsd // ignore: cast_nullable_to_non_nullable
as bool,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as BuildContext,
  ));
}


}

/// @nodoc


class _FetchCategories implements CreateTransactionEvent {
  const _FetchCategories();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchCategories);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateTransactionEvent.fetchCategories()';
}


}




/// @nodoc


class _ChangeOverallSums implements CreateTransactionEvent {
  const _ChangeOverallSums({required this.isIncome, required this.amount, required this.incomes, required this.expenses, required this.isUsd});
  

 final  bool isIncome;
 final  int amount;
 final  int incomes;
 final  int expenses;
 final  bool isUsd;

/// Create a copy of CreateTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeOverallSumsCopyWith<_ChangeOverallSums> get copyWith => __$ChangeOverallSumsCopyWithImpl<_ChangeOverallSums>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeOverallSums&&(identical(other.isIncome, isIncome) || other.isIncome == isIncome)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.incomes, incomes) || other.incomes == incomes)&&(identical(other.expenses, expenses) || other.expenses == expenses)&&(identical(other.isUsd, isUsd) || other.isUsd == isUsd));
}


@override
int get hashCode => Object.hash(runtimeType,isIncome,amount,incomes,expenses,isUsd);

@override
String toString() {
  return 'CreateTransactionEvent.changeOverallSums(isIncome: $isIncome, amount: $amount, incomes: $incomes, expenses: $expenses, isUsd: $isUsd)';
}


}

/// @nodoc
abstract mixin class _$ChangeOverallSumsCopyWith<$Res> implements $CreateTransactionEventCopyWith<$Res> {
  factory _$ChangeOverallSumsCopyWith(_ChangeOverallSums value, $Res Function(_ChangeOverallSums) _then) = __$ChangeOverallSumsCopyWithImpl;
@useResult
$Res call({
 bool isIncome, int amount, int incomes, int expenses, bool isUsd
});




}
/// @nodoc
class __$ChangeOverallSumsCopyWithImpl<$Res>
    implements _$ChangeOverallSumsCopyWith<$Res> {
  __$ChangeOverallSumsCopyWithImpl(this._self, this._then);

  final _ChangeOverallSums _self;
  final $Res Function(_ChangeOverallSums) _then;

/// Create a copy of CreateTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isIncome = null,Object? amount = null,Object? incomes = null,Object? expenses = null,Object? isUsd = null,}) {
  return _then(_ChangeOverallSums(
isIncome: null == isIncome ? _self.isIncome : isIncome // ignore: cast_nullable_to_non_nullable
as bool,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,incomes: null == incomes ? _self.incomes : incomes // ignore: cast_nullable_to_non_nullable
as int,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as int,isUsd: null == isUsd ? _self.isUsd : isUsd // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _FetchCategoriesIncome implements CreateTransactionEvent {
  const _FetchCategoriesIncome();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FetchCategoriesIncome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateTransactionEvent.fetchCategoriesIncome()';
}


}




// dart format on
