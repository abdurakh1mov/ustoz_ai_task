part of 'create_transaction_bloc.dart';

@freezed
abstract class CreateTransactionEvent with _$CreateTransactionEvent {
  const factory CreateTransactionEvent.createTransaction({
    required String amount,
    required String note,
    required DateTime date,
    required CategoryModel category,
    required bool isIncome,
    required bool isUsd,
    required BuildContext context,
  }) = _CreateTransactionEvent;

  const factory CreateTransactionEvent.fetchCategories() = _FetchCategories;
  const factory CreateTransactionEvent.fetchCategoriesIncome() =
      _FetchCategoriesIncome;
}
