import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/data/data_source/Movies_remote_api_data_source.dart';
import 'package:movies_app/core/data/repositories_impl/Move_repo_impl.dart';
import 'package:movies_app/core/domain/Use_case/get_movies_by_genra_usecase.dart';
import 'package:movies_app/core/domain/Use_case/get_movies_usecase.dart';
import 'package:movies_app/core/helper/helper_function.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';
import 'package:movies_app/features/Auth/See_More_Scree.dart';

import 'package:movies_app/features/main/explor/cubit/cubit/get_movies_by_genra_cubit.dart';
import 'package:movies_app/features/main/home/presentation/cubit/cubit/movies_cubit.dart';
import 'package:movies_app/features/main/home/presentation/widgets/MovieCarouselItem.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  int currentIndex = 0;
  late int randomNumber;

  late MoviesCubit moviesCubit;
  late GetMoviesByGenraCubit genraCubit;

  @override
  void initState() {
    super.initState();

    randomNumber = getRandomNumber();
    log('randomNumber: $randomNumber');

    moviesCubit = MoviesCubit(
      getMoviesUsecase: GetMoviesUsecase(
        moveRepo: MoveRepoImpl(
          moviesRemoteDataSource: MoviesRemoteApiDataSource(),
        ),
      ),
    )..getMovies();

    genraCubit = GetMoviesByGenraCubit(
      getMoviesByGenraUsecase: GetMoviesByGenraUsecase(
        moveRepo: MoveRepoImpl(
          moviesRemoteDataSource: MoviesRemoteApiDataSource(),
        ),
      ),
    )..getbygenraMovies(genre: ConstanstManager.Genres[randomNumber]);
  }

  @override
  void dispose() {
    moviesCubit.close();
    genraCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: moviesCubit),
        BlocProvider.value(value: genraCubit),
      ],
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is MoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MoviesError) {
            return Center(child: Text(state.ErrorMessage));
          }

          if (state is MoviesSuccess) {
            final movies = state.movies;

            return Stack(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    key: ValueKey(
                      movies.isNotEmpty
                          ? movies[currentIndex.clamp(0, movies.length - 1)].id
                          : 0,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          movies.isNotEmpty
                              ? movies[currentIndex.clamp(0, movies.length - 1)]
                                    .posterImage
                              : '',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(.1),
                        Colors.black.withOpacity(.9),
                        Colors.black,
                      ],
                    ),
                  ),
                ),

                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset('assets/image/Available_Now.png'),

                      CarouselSlider(
                        items: movies
                            .map((movie) => MovieCarouselItem(movie: movie))
                            .toList(),
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          height: 300.h,
                          viewportFraction: 0.55,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.23,
                          autoPlay: false,
                          enableInfiniteScroll: true,
                          aspectRatio: 1 / 2,
                        ),
                      ),

                      Image.asset('assets/image/Watch_Now.png'),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ConstanstManager.Genres[randomNumber],
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            BlocBuilder<
                              GetMoviesByGenraCubit,
                              GetMoviesByGenraState
                            >(
                              builder: (context, state) {
                                if (state is GetMoviesByGenraLoading) {
                                  return const CircularProgressIndicator();
                                }
                                if (state is GetMoviesByGenraError) {
                                  return Text(state.message);
                                }
                                if (state is GetMoviesByGenraSuccess) {
                                  return Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SeeMoreScree(
                                                    genre: ConstanstManager
                                                        .Genres[randomNumber],
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'See More',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w500,
                                            color: ColorsManager.primaryyellow,
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_sharp,
                                        color: ColorsManager.primaryyellow,
                                      ),
                                    ],
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),

                      SizedBox(
                        height: 220.h,
                        child:
                            BlocBuilder<
                              GetMoviesByGenraCubit,
                              GetMoviesByGenraState
                            >(
                              builder: (context, state) {
                                if (state is GetMoviesByGenraLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is GetMoviesByGenraSuccess) {
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                          child: Image.network(
                                            state.movies[index].posterImage,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }

                                if (state is GetMoviesByGenraError) {
                                  return Center(child: Text(state.message));
                                }

                                return const SizedBox();
                              },
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}





//(context, index) {
                                    //   final movie = movies[index];
                                    //   return Padding(
                                    //     padding: const EdgeInsets.all(8.0),
                                    //     child: MovieItem(movie: movie),
                                    //   );
                                    // },


//  BlocBuilder<MoviesCubit, MoviesState>(
//                   builder: (context, state) {
//                     if (state is MoviesLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     }

//                     if (state is MoviesError) {
//                       return Center(child: Text(state.ErrorMessage));
//                     }

//                     if (state is MoviesSuccess) {
//                       final movies = state.movies; // ✅ الداتا جاية من الكيوبت

//                       return CarouselSlider(
//                         items: movies
//                             .map(
//                               (movie) => MovieCarouselItem(
//                                 // أو poster من الـ Entity
//                                 movie: movie, // ✅ تباصي الفيلم كله
//                               ),
//                             )
//                             .toList(),

//                         options: CarouselOptions(
//                           onPageChanged: (index, reason) {
//                             setState(() {
//                               currentIndex = index;
//                             });
//                           },
//                           height: 300.h,
//                           viewportFraction: 0.55,
//                           enlargeCenterPage: true,
//                           enlargeFactor: 0.23,
//                           autoPlay: false,
//                           enableInfiniteScroll: true,
//                           aspectRatio: 1 / 2,
//                         ),
//                       );
//                     }

//                     return const SizedBox.shrink();
//                   },
//                 ),