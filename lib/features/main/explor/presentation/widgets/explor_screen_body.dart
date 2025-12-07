import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';
import 'package:movies_app/features/main/explor/cubit/cubit/get_movies_by_genra_cubit.dart';
import 'package:movies_app/core/widgets/Move_item.dart';
import 'package:movies_app/features/main/explor/presentation/widgets/genra_item.dart';

class ExplorScreenBody extends StatefulWidget {
  const ExplorScreenBody({super.key});

  @override
  State<ExplorScreenBody> createState() => _ExplorScreenBodyState();
}

class _ExplorScreenBodyState extends State<ExplorScreenBody> {
  int currentIndex = 0;
  @override
  void initState() {
    context.read<GetMoviesByGenraCubit>().getbygenraMovies(
      genre: ConstanstManager.Genres[currentIndex],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final genra = ConstanstManager.Genres[index];

              return GenraItem(
                title: genra,
                isSelected: currentIndex == index,
                onTap: () {
                  setState(() {
                    currentIndex = index;
                    context.read<GetMoviesByGenraCubit>().getbygenraMovies(
                      genre: genra,
                    );
                  });
                  log('$genra');
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemCount: ConstanstManager.Genres.length,
          ),
        ),
        SizedBox(height: 20.h),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
              return Container(height: 200.h, width: 200.w, color: Colors.red);
            },
          ),
        ),
      ],
    );
  }
}
