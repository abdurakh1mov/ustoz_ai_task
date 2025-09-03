part of 'home_cubit.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<TransactionModel?> userTransactions,
    @Default(false) bool isLoading,
    @Default(null) RateModel? rate,
    @Default(null) UserModel? userData,
  }) = _HomeState;
}
