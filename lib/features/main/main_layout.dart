import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/core/resources/constanst_manager.dart';
import 'package:movies_app/features/main/explor/explor_screen.dart';
import 'package:movies_app/features/main/home/home_screen.dart';
import 'package:movies_app/features/main/home/movieDetails.dart';
import 'package:movies_app/features/main/profile/profile_screen.dart';
import 'package:movies_app/features/main/search/search_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> screens = const [
    HomeScreen(key: ValueKey(0)),
    MovieDetails(key: ValueKey(1)),
    ExplorScreen(key: ValueKey(2)),
    ProfileScreen(key: ValueKey(3)),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// ✅ Animated Screens
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.1, 0), // حركة جانبية بسيطة
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: screens[currentIndex],
            ),
          ),

          /// ✅ Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 61.h,
              padding: const EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorsManager.grey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  ConstanstManager.navbaritems.length,
                  (index) => InkWell(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: AnimatedScale(
                      scale: currentIndex == index ? 1.2 : 1.0,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOutBack,
                      child: SvgPicture.asset(
                        ConstanstManager.navbaritems[index],
                        colorFilter: ColorFilter.mode(
                          currentIndex == index
                              ? ColorsManager.primaryyellow
                              : ColorsManager.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
