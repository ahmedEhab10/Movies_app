import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/cubit/cubit/add_to_favorite_cubit.dart';
import 'package:movies_app/core/domain/Entities/Move_Entity.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/Details_screen/widgets/cast_continar.dart';
import 'package:movies_app/features/Details_screen/widgets/genreItem.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddToFavoriteCubit, AddToFavoriteState>(
      listener: (context, state) {
        if (state is AddToFavoriteLoading) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Adding to favorite...")),
          );
        }

        if (state is AddToFavoriteSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Added to favorite ✅")));
        }

        if (state is AddToFavoriteError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          log(state.message);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  Image.network(
                    movie.posterImage,
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),

                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black.withOpacity(0), Colors.black],
                      ),
                    ),
                  ),

                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: ColorsManager.white.withOpacity(0.28),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: ColorsManager.primaryyellow,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: ColorsManager.white,
                        size: 45,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          movie.title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 24,
                            color: ColorsManager.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),

                        Text(
                          movie.year.toString(),
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            color: Color(0xFFC4C4C4),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 30.h,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            context.read<AddToFavoriteCubit>().addToFavorite(
                              movie,
                            );
                          },
                          icon: const Icon(Icons.bookmark, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    CustomElevatedButton(
                      text: 'watch',
                      onPressed: () {},
                      backgroundColor: ColorsManager.red,
                      textColor: Colors.white,
                    ),
                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: ColorsManager.primaryyellow,
                            ),
                            SizedBox(width: 5),
                            Text(
                              '90',
                              style: TextStyle(color: ColorsManager.white),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: ColorsManager.primaryyellow,
                            ),
                            SizedBox(width: 5),
                            Text(
                              movie.runtime.toString(),
                              style: TextStyle(color: ColorsManager.white),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: ColorsManager.primaryyellow,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              movie.rating.toString(),
                              style: const TextStyle(
                                color: ColorsManager.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Summary',
                      style: GoogleFonts.inter(
                        fontSize: 24.sp,
                        color: ColorsManager.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      movie.summary == ''
                          ? 'Following the events of Spider-Man No Way Home, Doctor Strange unwittingly casts a forbidden spell that accidentally opens up the multiverse. With help from Wong and Scarlet Witch, Strange confronts various versions of himself as well as teaming up with the young America Chavez while traveling through various realities and working to restore reality as he knows it. Along the way, Strange and his allies realize they must take on a powerful new adversary who seeks to take over the multiverse.—Blazer346'
                          : movie.summary,
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        color: ColorsManager.white,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'cast',
                      style: GoogleFonts.inter(
                        fontSize: 24.sp,
                        color: ColorsManager.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 10.h),
                    CastContinar(
                      actorname: ' Hayley Atwell',
                      cractername: 'Captain Carte',
                      actorimage: 'assets/image/actor1.png',
                    ),
                    SizedBox(height: 10.h),
                    CastContinar(
                      actorname: ' Elizabeth Olsen',
                      cractername: ' Wanda Maximof',
                      actorimage: 'assets/image/actor2.png',
                    ),
                    SizedBox(height: 10.h),
                    CastContinar(
                      actorname: 'Rachel McAdams',
                      cractername: 'Dr. Christine Palmer',
                      actorimage: 'assets/image/actor3.png',
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Genres',
                      style: GoogleFonts.inter(
                        fontSize: 24.sp,
                        color: ColorsManager.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),

                    SizedBox(
                      height: 100.h,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 3.2,
                            ),
                        itemCount: movie.genres.length,
                        itemBuilder: (context, index) {
                          final genre = movie.genres[index];

                          return Genreitem(title: genre);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}


 // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12),
            //   child: Row(
            //     children: const [
            //       Text(
            //         'Screen Shots',
            //         style: TextStyle(
            //           fontSize: 20,
            //           color: ColorsManager.white,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // const SizedBox(height: 15),

            // SizedBox(
            //   height: 120,
            //   child: ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: screenshots.length,
            //     separatorBuilder: (_, __) => const SizedBox(width: 12),
            //     itemBuilder: (_, index) {
            //       return ClipRRect(
            //         borderRadius: BorderRadius.circular(12),
            //         child: Image.asset(
            //           screenshots[index],
            //           width: 180,
            //           fit: BoxFit.cover,
            //         ),
            //       );
            //     },
            //   ),
            // ),