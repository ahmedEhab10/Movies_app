import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/data/data_source/Movies_remote_api_data_source.dart';
import 'package:movies_app/core/data/repositories_impl/Move_repo_impl.dart';
import 'package:movies_app/core/domain/Use_case/get_movies_usecase.dart';
import 'package:movies_app/features/main/search/presentation/cubit/cubit/search_cubit.dart';
import 'package:movies_app/features/main/search/presentation/widgets/search_screen_ody.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        getMoviesUsecase: GetMoviesUsecase(
          moveRepo: MoveRepoImpl(
            moviesRemoteDataSource: MoviesRemoteApiDataSource(),
          ),
        ),
      ),
      child: const SearchScreenbody(),
    );
  }
}
