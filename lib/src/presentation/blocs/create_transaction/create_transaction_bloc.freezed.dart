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

 bool get isLoading; bool get isCreatingLoading; bool get isDeletingLoading; bool get isSuccess; String? get errorMessage; List<CategoryModel> get categories; List<CategoryModel> get categoriesIncome;
/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTransactionStateCopyWith<CreateTransactionState> get copyWith => _$CreateTransactionStateCopyWithImpl<CreateTransactionState>(this as CreateTransactionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransactionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCreatingLoading, isCreatingLoading) || other.isCreatingLoading == isCreatingLoading)&&(identical(other.isDeletingLoading, isDeletingLoading) || other.isDeletingLoading == isDeletingLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.categoriesIncome, categoriesIncome));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isCreatingLoading,isDeletingLoading,isSuccess,errorMessage,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(categoriesIncome));

@override
String toString() {
  return 'CreateTransactionState(isLoading: $isLoading, isCreatingLoading: $isCreatingLoading, isDeletingLoading: $isDeletingLoading, isSuccess: $isSuccess, errorMessage: $errorMessage, categories: $categories, categoriesIncome: $categoriesIncome)';
}


}

/// @nodoc
abstract mixin class $CreateTransactionStateCopyWith<$Res>  {
  factory $CreateTransactionStateCopyWith(CreateTransactionState value, $Res Function(CreateTransactionState) _then) = _$CreateTransactionStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isCreatingLoading, bool isDeletingLoading, bool isSuccess, String? errorMessage, List<CategoryModel> categories, List<CategoryModel> categoriesIncome
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
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isCreatingLoading = null,Object? isDeletingLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,Object? categories = null,Object? categoriesIncome = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCreatingLoading: null == isCreatingLoading ? _self.isCreatingLoading : isCreatingLoading // ignore: cast_nullable_to_non_nullable
as bool,isDeletingLoading: null == isDeletingLoading ? _self.isDeletingLoading : isDeletingLoading // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isCreatingLoading,  bool isDeletingLoading,  bool isSuccess,  String? errorMessage,  List<CategoryModel> categories,  List<CategoryModel> categoriesIncome)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransactionState() when $default != null:
return $default(_that.isLoading,_that.isCreatingLoading,_that.isDeletingLoading,_that.isSuccess,_that.errorMessage,_that.categories,_that.categoriesIncome);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isCreatingLoading,  bool isDeletingLoading,  bool isSuccess,  String? errorMessage,  List<CategoryModel> categories,  List<CategoryModel> categoriesIncome)  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionState():
return $default(_that.isLoading,_that.isCreatingLoading,_that.isDeletingLoading,_that.isSuccess,_that.errorMessage,_that.categories,_that.categoriesIncome);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isCreatingLoading,  bool isDeletingLoading,  bool isSuccess,  String? errorMessage,  List<CategoryModel> categories,  List<CategoryModel> categoriesIncome)?  $default,) {final _that = this;
switch (_that) {
case _CreateTransactionState() when $default != null:
return $default(_that.isLoading,_that.isCreatingLoading,_that.isDeletingLoading,_that.isSuccess,_that.errorMessage,_that.categories,_that.categoriesIncome);case _:
  return null;

}
}

}

/// @nodoc


class _CreateTransactionState implements CreateTransactionState {
  const _CreateTransactionState({this.isLoading = false, this.isCreatingLoading = false, this.isDeletingLoading = false, this.isSuccess = false, this.errorMessage, final  List<CategoryModel> categories = const [], final  List<CategoryModel> categoriesIncome = const []}): _categories = categories,_categoriesIncome = categoriesIncome;
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isCreatingLoading;
@override@JsonKey() final  bool isDeletingLoading;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCreatingLoading, isCreatingLoading) || other.isCreatingLoading == isCreatingLoading)&&(identical(other.isDeletingLoading, isDeletingLoading) || other.isDeletingLoading == isDeletingLoading)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._categoriesIncome, _categoriesIncome));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isCreatingLoading,isDeletingLoading,isSuccess,errorMessage,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_categoriesIncome));

@override
String toString() {
  return 'CreateTransactionState(isLoading: $isLoading, isCreatingLoading: $isCreatingLoading, isDeletingLoading: $isDeletingLoading, isSuccess: $isSuccess, errorMessage: $errorMessage, categories: $categories, categoriesIncome: $categoriesIncome)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionStateCopyWith<$Res> implements $CreateTransactionStateCopyWith<$Res> {
  factory _$CreateTransactionStateCopyWith(_CreateTransactionState value, $Res Function(_CreateTransactionState) _then) = __$CreateTransactionStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isCreatingLoading, bool isDeletingLoading, bool isSuccess, String? errorMessage, List<CategoryModel> categories, List<CategoryModel> categoriesIncome
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
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isCreatingLoading = null,Object? isDeletingLoading = null,Object? isSuccess = null,Object? errorMessage = freezed,Object? categories = null,Object? categoriesIncome = null,}) {
  return _then(_CreateTransactionState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCreatingLoading: null == isCreatingLoading ? _self.isCreatingLoading : isCreatingLoading // ignore: cast_nullable_to_non_nullable
as bool,isDeletingLoading: null == isDeletingLoading ? _self.isDeletingLoading : isDeletingLoading // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateTransactionEvent value)?  createTransaction,TResult Function( _ChangeTransaction value)?  changeTransaction,TResult Function( _DeleteTransaction value)?  deleteTransaction,TResult Function( _FetchCategories value)?  fetchCategories,TResult Function( _ChangeOverallSums value)?  changeOverallSums,TResult Function( _FetchCategoriesIncome value)?  fetchCategoriesIncome,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransactionEvent() when createTransaction != null:
return createTransaction(_that);case _ChangeTransaction() when changeTransaction != null:
return changeTransaction(_that);case _DeleteTransaction() when deleteTransaction != null:
return deleteTransaction(_that);case _FetchCategories() when fetchCategories != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateTransactionEvent value)  createTransaction,required TResult Function( _ChangeTransaction value)  changeTransaction,required TResult Function( _DeleteTransaction value)  deleteTransaction,required TResult Function( _FetchCategories value)  fetchCategories,required TResult Function( _ChangeOverallSums value)  changeOverallSums,required TResult Function( _FetchCategoriesIncome value)  fetchCategoriesIncome,}){
final _that = this;
switch (_that) {
case _CreateTransactionEvent():
return createTransaction(_that);case _ChangeTransaction():
return changeTransaction(_that);case _DeleteTransaction():
return deleteTransaction(_that);case _FetchCategories():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateTransactionEvent value)?  createTransaction,TResult? Function( _ChangeTransaction value)?  changeTransaction,TResult? Function( _DeleteTransaction value)?  deleteTransaction,TResult? Function( _FetchCategories value)?  fetchCategories,TResult? Function( _ChangeOverallSums value)?  changeOverallSums,TResult? Function( _FetchCategoriesIncome value)?  fetchCategoriesIncome,}){
final _that = this;
switch (_that) {
case _CreateTransactionEvent() when createTransaction != null:
return createTransaction(_that);case _ChangeTransaction() when changeTransaction != null:
return changeTransaction(_that);case _DeleteTransaction() when deleteTransaction != null:
return deleteTransaction(_that);case _FetchCategories() when fetchCategories != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TransactionModel transaction,  BuildContext context)?  createTransaction,TResult Function( TransactionModel transaction,  BuildContext context)?  changeTransaction,TResult Function( TransactionModel transaction,  BuildContext context)?  deleteTransaction,TResult Function()?  fetchCategories,TResult Function( bool isIncome,  int amount,  int incomes,  int expenses,  bool isUsd,  bool isDeleting)?  changeOverallSums,TResult Function()?  fetchCategoriesIncome,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransactionEvent() when createTransaction != null:
return createTransaction(_that.transaction,_that.context);case _ChangeTransaction() when changeTransaction != null:
return changeTransaction(_that.transaction,_that.context);case _DeleteTransaction() when deleteTransaction != null:
return deleteTransaction(_that.transaction,_that.context);case _FetchCategories() when fetchCategories != null:
return fetchCategories();case _ChangeOverallSums() when changeOverallSums != null:
return changeOverallSums(_that.isIncome,_that.amount,_that.incomes,_that.expenses,_that.isUsd,_that.isDeleting);case _FetchCategoriesIncome() when fetchCategoriesIncome != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TransactionModel transaction,  BuildContext context)  createTransaction,required TResult Function( TransactionModel transaction,  BuildContext context)  changeTransaction,required TResult Function( TransactionModel transaction,  BuildContext context)  deleteTransaction,required TResult Function()  fetchCategories,required TResult Function( bool isIncome,  int amount,  int incomes,  int expenses,  bool isUsd,  bool isDeleting)  changeOverallSums,required TResult Function()  fetchCategoriesIncome,}) {final _that = this;
switch (_that) {
case _CreateTransactionEvent():
return createTransaction(_that.transaction,_that.context);case _ChangeTransaction():
return changeTransaction(_that.transaction,_that.context);case _DeleteTransaction():
return deleteTransaction(_that.transaction,_that.context);case _FetchCategories():
return fetchCategories();case _ChangeOverallSums():
return changeOverallSums(_that.isIncome,_that.amount,_that.incomes,_that.expenses,_that.isUsd,_that.isDeleting);case _FetchCategoriesIncome():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TransactionModel transaction,  BuildContext context)?  createTransaction,TResult? Function( TransactionModel transaction,  BuildContext context)?  changeTransaction,TResult? Function( TransactionModel transaction,  BuildContext context)?  deleteTransaction,TResult? Function()?  fetchCategories,TResult? Function( bool isIncome,  int amount,  int incomes,  int expenses,  bool isUsd,  bool isDeleting)?  changeOverallSums,TResult? Function()?  fetchCategoriesIncome,}) {final _that = this;
switch (_that) {
case _CreateTransactionEvent() when createTransaction != null:
return createTransaction(_that.transaction,_that.context);case _ChangeTransaction() when changeTransaction != null:
return changeTransaction(_that.transaction,_that.context);case _DeleteTransaction() when deleteTransaction != null:
return deleteTransaction(_that.transaction,_that.context);case _FetchCategories() when fetchCategories != null:
return fetchCategories();case _ChangeOverallSums() when changeOverallSums != null:
return changeOverallSums(_that.isIncome,_that.amount,_that.incomes,_that.expenses,_that.isUsd,_that.isDeleting);case _FetchCategoriesIncome() when fetchCategoriesIncome != null:
return fetchCategoriesIncome();case _:
  return null;

}
}

}

/// @nodoc


class _CreateTransactionEvent implements CreateTransactionEvent {
  const _CreateTransactionEvent({required this.transaction, required this.context});
  

 final  TransactionModel transaction;
 final  BuildContext context;

/// Create a copy of CreateTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionEventCopyWith<_CreateTransactionEvent> get copyWith => __$CreateTransactionEventCopyWithImpl<_CreateTransactionEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionEvent&&(identical(other.transaction, transaction) || other.transaction == transaction)&&(identical(other.context, context) || other.context == context));
}


@override
int get hashCode => Object.hash(runtimeType,transaction,context);

@override
String toString() {
  return 'CreateTransactionEvent.createTransaction(transaction: $transaction, context: $context)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionEventCopyWith<$Res> implements $CreateTransactionEventCopyWith<$Res> {
  factory _$CreateTransactionEventCopyWith(_CreateTransactionEvent value, $Res Function(_CreateTransactionEvent) _then) = __$CreateTransactionEventCopyWithImpl;
@useResult
$Res call({
 TransactionModel transaction, BuildContext context
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
@pragma('vm:prefer-inline') $Res call({Object? transaction = null,Object? context = null,}) {
  return _then(_CreateTransactionEvent(
transaction: null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as TransactionModel,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as BuildContext,
  ));
}


}

/// @nodoc


class _ChangeTransaction implements CreateTransactionEvent {
  const _ChangeTransaction({required this.transaction, required this.context});
  

 final  TransactionModel transaction;
 final  BuildContext context;

/// Create a copy of CreateTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeTransactionCopyWith<_ChangeTransaction> get copyWith => __$ChangeTransactionCopyWithImpl<_ChangeTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeTransaction&&(identical(other.transaction, transaction) || other.transaction == transaction)&&(identical(other.context, context) || other.context == context));
}


@override
int get hashCode => Object.hash(runtimeType,transaction,context);

@override
String toString() {
  return 'CreateTransactionEvent.changeTransaction(transaction: $transaction, context: $context)';
}


}

/// @nodoc
abstract mixin class _$ChangeTransactionCopyWith<$Res> implements $CreateTransactionEventCopyWith<$Res> {
  factory _$ChangeTransactionCopyWith(_ChangeTransaction value, $Res Function(_ChangeTransaction) _then) = __$ChangeTransactionCopyWithImpl;
@useResult
$Res call({
 TransactionModel transaction, BuildContext context
});




}
/// @nodoc
class __$ChangeTransactionCopyWithImpl<$Res>
    implements _$ChangeTransactionCopyWith<$Res> {
  __$ChangeTransactionCopyWithImpl(this._self, this._then);

  final _ChangeTransaction _self;
  final $Res Function(_ChangeTransaction) _then;

/// Create a copy of CreateTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transaction = null,Object? context = null,}) {
  return _then(_ChangeTransaction(
transaction: null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as TransactionModel,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as BuildContext,
  ));
}


}

/// @nodoc


class _DeleteTransaction implements CreateTransactionEvent {
  const _DeleteTransaction({required this.transaction, required this.context});
  

 final  TransactionModel transaction;
 final  BuildContext context;

/// Create a copy of CreateTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteTransactionCopyWith<_DeleteTransaction> get copyWith => __$DeleteTransactionCopyWithImpl<_DeleteTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteTransaction&&(identical(other.transaction, transaction) || other.transaction == transaction)&&(identical(other.context, context) || other.context == context));
}


@override
int get hashCode => Object.hash(runtimeType,transaction,context);

@override
String toString() {
  return 'CreateTransactionEvent.deleteTransaction(transaction: $transaction, context: $context)';
}


}

/// @nodoc
abstract mixin class _$DeleteTransactionCopyWith<$Res> implements $CreateTransactionEventCopyWith<$Res> {
  factory _$DeleteTransactionCopyWith(_DeleteTransaction value, $Res Function(_DeleteTransaction) _then) = __$DeleteTransactionCopyWithImpl;
@useResult
$Res call({
 TransactionModel transaction, BuildContext context
});




}
/// @nodoc
class __$DeleteTransactionCopyWithImpl<$Res>
    implements _$DeleteTransactionCopyWith<$Res> {
  __$DeleteTransactionCopyWithImpl(this._self, this._then);

  final _DeleteTransaction _self;
  final $Res Function(_DeleteTransaction) _then;

/// Create a copy of CreateTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? transaction = null,Object? context = null,}) {
  return _then(_DeleteTransaction(
transaction: null == transaction ? _self.transaction : transaction // ignore: cast_nullable_to_non_nullable
as TransactionModel,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
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
  const _ChangeOverallSums({required this.isIncome, required this.amount, required this.incomes, required this.expenses, required this.isUsd, required this.isDeleting});
  

 final  bool isIncome;
 final  int amount;
 final  int incomes;
 final  int expenses;
 final  bool isUsd;
 final  bool isDeleting;

/// Create a copy of CreateTransactionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeOverallSumsCopyWith<_ChangeOverallSums> get copyWith => __$ChangeOverallSumsCopyWithImpl<_ChangeOverallSums>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeOverallSums&&(identical(other.isIncome, isIncome) || other.isIncome == isIncome)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.incomes, incomes) || other.incomes == incomes)&&(identical(other.expenses, expenses) || other.expenses == expenses)&&(identical(other.isUsd, isUsd) || other.isUsd == isUsd)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting));
}


@override
int get hashCode => Object.hash(runtimeType,isIncome,amount,incomes,expenses,isUsd,isDeleting);

@override
String toString() {
  return 'CreateTransactionEvent.changeOverallSums(isIncome: $isIncome, amount: $amount, incomes: $incomes, expenses: $expenses, isUsd: $isUsd, isDeleting: $isDeleting)';
}


}

/// @nodoc
abstract mixin class _$ChangeOverallSumsCopyWith<$Res> implements $CreateTransactionEventCopyWith<$Res> {
  factory _$ChangeOverallSumsCopyWith(_ChangeOverallSums value, $Res Function(_ChangeOverallSums) _then) = __$ChangeOverallSumsCopyWithImpl;
@useResult
$Res call({
 bool isIncome, int amount, int incomes, int expenses, bool isUsd, bool isDeleting
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
@pragma('vm:prefer-inline') $Res call({Object? isIncome = null,Object? amount = null,Object? incomes = null,Object? expenses = null,Object? isUsd = null,Object? isDeleting = null,}) {
  return _then(_ChangeOverallSums(
isIncome: null == isIncome ? _self.isIncome : isIncome // ignore: cast_nullable_to_non_nullable
as bool,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,incomes: null == incomes ? _self.incomes : incomes // ignore: cast_nullable_to_non_nullable
as int,expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as int,isUsd: null == isUsd ? _self.isUsd : isUsd // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
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
