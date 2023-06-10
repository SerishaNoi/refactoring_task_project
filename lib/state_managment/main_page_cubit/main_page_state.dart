part of 'main_page_cubit.dart';

class MainPageState {
  final List<UserModel> users;
  final CubitState state;
  final String erroreMessage;
  final bool isLoading;

  MainPageState({
    this.users = const [],
    this.state = CubitState.initial,
    this.erroreMessage = '',
    this.isLoading = true,
  });

  List<Object> get props => [
        users,
        state,
        erroreMessage,
        isLoading,
      ];

  MainPageState copyWith({
    final List<UserModel>? users,
    final CubitState? state,
    final String? erroreMessage,
    final bool? isLoading,
  }) {
    return MainPageState(
      users: users ?? this.users,
      state: state ?? this.state,
      erroreMessage: erroreMessage ?? this.erroreMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
