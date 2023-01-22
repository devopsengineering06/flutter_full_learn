import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_model.dart';
import 'login_cubit_state.dart';

// 1. yol
// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());
// }

// 2 yol   Hocanın yöntemi
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> checkUser(String email, String password) async {
    // emit(LoginState(isLoading: true, model: User(email: email, password: password)));
    emit(state.copyWith(isLoading: true, model: User(email: email, password: password)));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isLoading: false));
  }
}
