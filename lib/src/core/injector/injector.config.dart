// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ustoz_ai_task/src/core/cache/db_service.dart' as _i1048;
import 'package:ustoz_ai_task/src/data/repository_impl/auth_repository_impl.dart'
    as _i778;
import 'package:ustoz_ai_task/src/data/repository_impl/main_repository_impl.dart'
    as _i335;
import 'package:ustoz_ai_task/src/domain/repository_interface/auth_repository_interface.dart'
    as _i814;
import 'package:ustoz_ai_task/src/domain/repository_interface/main_repository_interface.dart'
    as _i343;
import 'package:ustoz_ai_task/src/presentation/blocs/create_transaction/create_transaction_bloc.dart'
    as _i953;
import 'package:ustoz_ai_task/src/presentation/blocs/home/home_cubit.dart'
    as _i712;
import 'package:ustoz_ai_task/src/presentation/blocs/login/login_cubit.dart'
    as _i655;
import 'package:ustoz_ai_task/src/presentation/blocs/sign_up/sign_up_cubit.dart'
    as _i372;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i1048.DbService>(() => _i1048.DbService());
    gh.factory<_i343.MainRepositoryInterface>(() => _i335.MainRepositoryImpl());
    gh.factory<_i814.AuthRepositoryInterface>(() => _i778.AuthRepositoryImpl());
    gh.factory<_i372.SingUpBloc>(
      () =>
          _i372.SingUpBloc(authRepository: gh<_i814.AuthRepositoryInterface>()),
    );
    gh.factory<_i655.LoginCubit>(
      () =>
          _i655.LoginCubit(authRepository: gh<_i814.AuthRepositoryInterface>()),
    );
    gh.factory<_i712.HomeCubit>(
      () => _i712.HomeCubit(repository: gh<_i343.MainRepositoryInterface>()),
    );
    gh.factory<_i953.CreateTransactionBloc>(
      () => _i953.CreateTransactionBloc(
        repository: gh<_i343.MainRepositoryInterface>(),
      ),
    );
    return this;
  }
}
