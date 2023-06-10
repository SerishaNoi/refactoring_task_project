import 'package:eds_test/data/repository/app_repo.dart';
import 'package:eds_test/data/services/app_data_source.dart';
import 'package:eds_test/data/services/local_storage_halper/local_starage_halper.dart';
import 'package:eds_test/data/services/local_storage_halper/local_storage_halper_impl.dart';
import 'package:eds_test/data/services/network_info.dart';
import 'package:eds_test/state_managment/main_page_cubit/main_page_cubit.dart';
import 'package:eds_test/state_managment/user_cubit/user_cubit.dart';

import 'package:get_it/get_it.dart';

GetIt getItInstance = GetIt.instance;

void getItInit() {
  getItInstance.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
      appDataSource: getItInstance(),
      localStorageHalper: getItInstance(),
      networkInfo: getItInstance(),
    ),
  );

  getItInstance.registerLazySingleton<LocalStorageHalper>(() => LocalStorageHalperImpl());

  getItInstance.registerLazySingleton(() => NetworkInfo());

  getItInstance.registerLazySingleton(() => AppDataSource());

  // Cubits
  getItInstance.registerFactory(() => MainPageCubit(appRepository: getItInstance()));

  getItInstance.registerFactory(() => UserPageCubit(appRepository: getItInstance()));
}
