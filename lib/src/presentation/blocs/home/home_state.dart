part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<TransactionModel?> userTransactions,
    @Default(false) bool isLoading,
    @Default(null) RateModel? rate,
    @Default(null) UserModel? userData,
    @Default("") String selectedDate,
    @Default("") String selectedCategory,
    @Default(null) DateTime? startDate,
    @Default(null) DateTime? endDate,
    @Default(null) bool? isIncome,
    @Default(false) bool isFiltered,
    @Default(null) bool? isUsd,
    @Default([]) List<CategoryModel> categories,
    @Default([]) List<CategoryModel> categoriesIncome,
    @Default([]) List<String> typesList,
    @Default([]) List<String> staticDatesList,
  }) = _HomeState;
}
