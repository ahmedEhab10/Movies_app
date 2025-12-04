import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/Auth/data/Models/Register_request.dart';
import 'package:movies_app/features/Auth/domain/repositories/auth_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authRepository}) : super(RegisterInitial());
  AuthRepository authRepository;

  Future<void> register(RegisterRequest registerRequest) async {
    emit(RegisterLoading());
    final result = await authRepository.regiser(registerRequest);
    result.fold(
      (errormassage) {
        emit(RegisterError(errormassage));
      },
      (user) {
        emit(RegisterSuccess());
      },
    );
  }
}
