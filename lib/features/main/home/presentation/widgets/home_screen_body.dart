import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/data/data_source/Movies_remote_api_data_source.dart';
import 'package:movies_app/core/data/repositories_impl/Move_repo_impl.dart';
import 'package:movies_app/core/domain/Use_case/get_movies_usecase.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';
import 'package:movies_app/features/main/home/presentation/cubit/cubit/movies_cubit.dart';
import 'package:movies_app/features/main/home/presentation/widgets/MovieCarouselItem.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MoviesCubit(
            getMoviesUsecase: GetMoviesUsecase(
              moveRepo: MoveRepoImpl(
                moviesRemoteDataSource: MoviesRemoteApiDataSource(),
              ),
            ),
          )..getMovies(),
        ),
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
                    key: ValueKey(state.movies[currentIndex].id),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          state.movies[currentIndex].posterImage,
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

                      SizedBox(height: 12.h),

                      Image.asset('assets/image/Watch_Now.png'),

                      SizedBox(height: 12.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Action',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'See More',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ColorsManager.primaryyellow,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: ColorsManager.primaryyellow,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 220.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              Image.asset('assets/image/Move_poser5.png'),
                          itemCount: 10,
                        ),
                      ),
                    ],
                  ),
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