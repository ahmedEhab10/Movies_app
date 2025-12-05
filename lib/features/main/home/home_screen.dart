import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryblack,
      body: Stack(
        children: [
          Container(
            height: 354,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/Available_Now.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 230,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;

                      if (_pageController.position.haveDimensions) {
                        value = (_pageController.page! - index).abs();
                        value = (1 - value * 0.3).clamp(0.0, 1.0);
                      }

                      return Center(
                        child: Transform.scale(
                          scale: value,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("assets/image/Card_film.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 420),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Action",
                        style: TextStyle(
                          color: ColorsManager.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "See more",
                        style: TextStyle(
                          color: ColorsManager.primaryyellow,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 10,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/image/Card_film.png",
                            ), // صور الأكشن
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
