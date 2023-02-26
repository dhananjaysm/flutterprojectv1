import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mileazofltr/logic/cubits/login_cubit/login_register_state.dart';
import 'package:mileazofltr/services/authentication.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthenticationRepository _authenticationRepository;

  RegisterCubit({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(RegisterInitial());

  Future<void> register(String phoneNumber, String password) async {
    emit(RegisterLoading());
    try {
      await _authenticationRepository.register(phoneNumber, password);
      emit(RegisterSuccess());
    } on Exception catch (e) {
      emit(RegisterFailure(error: e.toString()));
    }
  }
}
