import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/main/profile/data/data_source/Remote/get_profile_api_data.dart';
import 'package:movies_app/features/main/profile/data/repository_impl/get_profile_repo_impl.dart';
import 'package:movies_app/features/main/profile/domain/Use_case/get_profile_usecase.dart';
import 'package:movies_app/features/main/profile/presentation/Cubit/cubit/profile_cubit.dart';

import 'package:movies_app/features/main/profile/presentation/widgets/information_container.dart';

class ProfilScreenBody extends StatelessWidget {
  const ProfilScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        getProfileUsecase: GetProfileUsecase(
          getProfileRepo: GetProfileRepoImpl(
            getProfileData: GetProfileApiData(),
          ),
        ),
      )..getProfileData(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileError) {
            return Center(child: Text(state.message));
          }
          if (state is ProfileSuccess) {
            return Column(
              children: [
                information_container(
                  userProfileEntity: state.userProfileEntity,
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
