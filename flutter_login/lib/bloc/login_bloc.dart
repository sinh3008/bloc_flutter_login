import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>(_handleLoginButtonPressed);
  }

  void _handleLoginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    if (event.username.compareTo('admin') == 0 &&
        event.password.compareTo('admin') == 0) {
      emit(LoginLoading());

      await Future.delayed(const Duration(seconds: 2));

      emit(LoginSuccess());
    } else {
      emit(LoginLoading());

      await Future.delayed(const Duration(seconds: 2));

      emit(LoginFailure(error: 'Invalid username or password'));
    }
  }
}
