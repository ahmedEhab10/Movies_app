import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/Auth/data/Models/Login_request.dart';
import 'package:movies_app/features/Auth/domain/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepository}) : super(LoginInitial());
  AuthRepository authRepository;
  Future<void> loginN({required Login_request loginRequest}) async {
    emit(LoginLoading());
    final result = await authRepository.login(loginRequest);
    result.fold(
      (errormassage) {
        emit(LoginError(errormassage));
      },
      (user) {
        emit(LoginSuccess());
      },
    );
  }
}
