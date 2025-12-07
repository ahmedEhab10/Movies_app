import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/data/data_source/Movies_remote_api_data_source.dart';
import 'package:movies_app/core/data/repositories_impl/Move_repo_impl.dart';
import 'package:movies_app/core/domain/Use_case/get_movies_by_genra_usecase.dart';
import 'package:movies_app/core/widgets/Move_item.dart';
import 'package:movies_app/features/main/explor/cubit/cubit/get_movies_by_genra_cubit.dart';

class SeeMoreScree extends StatelessWidget {
  const SeeMoreScree({super.key, required this.genre});
  final String genre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetMoviesByGenraCubit(
          getMoviesByGenraUsecase: GetMoviesByGenraUsecase(
            moveRepo: MoveRepoImpl(
              moviesRemoteDataSource: MoviesRemoteApiDataSource(),
            ),
          ),
        )..getbygenraMovies(genre: genre),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<GetMoviesByGenraCubit, GetMoviesByGenraState>(
                builder: (context, state) {
                  if (state is GetMoviesByGenraLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is GetMoviesByGenraError) {
                    return Center(child: Text(state.message));
                  }
                  if (state is GetMoviesByGenraSuccess) {
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      itemCount: 12,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.65,
                          ),
                      itemBuilder: (context, index) {
                        // final movie = state.movies[index];
                        return MoveItem(move: state.movies[index]);
                      },
                    );
                  }
                  return Container(
                    height: 200.h,
                    width: 200.w,
                    color: Colors.red,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//MoveItem(move: state.movies[index]);