part of 'create_transaction_bloc.dart';

@freezed
abstract class CreateTransactionEvent with _$CreateTransactionEvent {
  const factory CreateTransactionEvent.createTransaction({
    required TransactionModel transaction,
    required BuildContext context,
  }) = _CreateTransactionEvent;

  const factory CreateTransactionEvent.changeTransaction({
    required TransactionModel transaction,
    required BuildContext context,
  }) = _ChangeTransaction;

  const factory CreateTransactionEvent.deleteTransaction({
    required TransactionModel transaction,
    required BuildContext context,
  }) = _DeleteTransaction;

  const factory CreateTransactionEvent.fetchCategories() = _FetchCategories;
  const factory CreateTransactionEvent.changeOverallSums({
    required bool isIncome,
    required int amount,
    required int incomes,
    required int expenses,
    required bool isUsd,
    required bool isDeleting,
  }) = _ChangeOverallSums;
  const factory CreateTransactionEvent.fetchCategoriesIncome() =
      _FetchCategoriesIncome;
}
