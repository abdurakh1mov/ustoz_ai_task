part of 'main_bloc.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(null) List<CategoryModel>? categories,
    @Default(false) bool isLoading,
  }) = _MainState;
}
