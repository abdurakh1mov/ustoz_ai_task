part of 'create_transaction_bloc.dart';

@freezed
abstract class CreateTransactionState with _$CreateTransactionState {
  const factory CreateTransactionState({
    @Default(false) bool isLoading,
    @Default(false) bool isCreatingLoading,
    @Default(false) bool isSuccess,
    String? errorMessage,
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<CategoryModel> categoriesIncome,
  }) = _CreateTransactionState;
}
