import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';
import 'package:movies_app/features/main/home/widgets/MovieCarouselItem.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Container(
            key: ValueKey(ConstanstManager.Movies_images[currentIndex]),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ConstanstManager.Movies_images[currentIndex]),
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
                items: ConstanstManager.Movies_images.map(
                  (item) => MovieCarouselItem(imagePath: item),
                ).toList(),
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
}
