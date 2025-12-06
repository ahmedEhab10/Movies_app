import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/features/main/profile/domain/Entities/User_Entity.dart';
import 'package:movies_app/features/main/profile/domain/Use_case/get_profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.getProfileUsecase}) : super(ProfileInitial());
  GetProfileUsecase getProfileUsecase;

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    var result = await getProfileUsecase.call();
    result.fold(
      (errormassage) => emit(ProfileError(message: errormassage)),
      (user) => emit(ProfileSuccess(userProfileEntity: user)),
    );
  }
}
