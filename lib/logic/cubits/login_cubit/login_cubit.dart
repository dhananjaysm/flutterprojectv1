import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mileazofltr/logic/cubits/login_cubit/login_register_state.dart';
import 'package:mileazofltr/services/authentication.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginCubit({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(LoginInitial());

  Future<void> login(String phoneNumber, String password) async {
    emit(LoginLoading());
    try {
      await _authenticationRepository.login(phoneNumber, password);
      emit(LoginSuccess());
    } on Exception catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
