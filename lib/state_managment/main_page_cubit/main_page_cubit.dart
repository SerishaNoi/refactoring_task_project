import 'package:bloc/bloc.dart';
import 'package:eds_test/data/models/hive_models/hive_user_model.dart';
import 'package:eds_test/data/repository/app_repo.dart';
import 'package:eds_test/data/services/network_info.dart';
import 'package:eds_test/methods/show_network_errore_message.dart';
import 'package:eds_test/state_managment/cubit_satates.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  final AppRepository appRepository;

  MainPageCubit({
    required this.appRepository,
  }) : super(MainPageState()) {
    loadUsers();
  }

  loadUsers() async {
    emit(state.copyWith(state: CubitState.loading));

    if (await NetworkInfo().checkConnectivity() == true) {
      final data = await appRepository.fetchUsers();

      if (data.isNotEmpty) {
        emit(state.copyWith(users: data, state: CubitState.loaded, isLoading: false));
      }

      if (data.isEmpty) {
        emit(
          state.copyWith(
              erroreMessage: 'Something got wrong', state: CubitState.failure, isLoading: false),
        );
      }
    } else {
      emit(state.copyWith(state: CubitState.failure));
      showNetworkErroreToast();
    }
  }
}
