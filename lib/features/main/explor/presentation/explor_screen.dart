import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/data/data_source/Movies_remote_api_data_source.dart';
import 'package:movies_app/core/data/repositories_impl/Move_repo_impl.dart';
import 'package:movies_app/core/domain/Use_case/get_movies_by_genra_usecase.dart';
import 'package:movies_app/features/main/explor/cubit/cubit/get_movies_by_genra_cubit.dart';
import 'package:movies_app/features/main/explor/presentation/widgets/explor_screen_body.dart';

class ExplorScreen extends StatelessWidget {
  const ExplorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => GetMoviesByGenraCubit(
            getMoviesByGenraUsecase: GetMoviesByGenraUsecase(
              moveRepo: MoveRepoImpl(
                moviesRemoteDataSource: MoviesRemoteApiDataSource(),
              ),
            ),
          ),
          child: ExplorScreenBody(),
        ),
      ),
    );
  }
}
