import 'package:flutter/material.dart';
import 'package:movies_app/core/routes_manager/app_routes.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/inboarding/widget/back_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int currentPage = 0;

  List<Map<String, String>> pages = [
    {
      "image": "assets/image/inboard1.png",
      "title": "Discover Movies",
      "subtitle":
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
    },
    {
      "image": "assets/image/inboard2.png",
      "title": "Explore All Genres",
      "subtitle":
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
    },
    {
      "image": "assets/image/inboard3.png",
      "title": "Create Watchlists",
      "subtitle":
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    },
    {
      "image": "assets/image/inboard4.png",
      "title": "Rate, Review, and Learn",
      "subtitle":
          "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    },
    {
      "image": "assets/image/inboard5.png",
      "title": "Start Watching Now",
      "subtitle": "",
    },
  ];

  void goNext() {
    if (currentPage < pages.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, AppRoutes.loin_screen);
    }
  }

  void goBack() {
    if (currentPage > 0) {
      controller.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: pages.length,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            children: [
              /// IMAGE
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    pages[index]["image"]!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// CONTENT BOX
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.31,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        pages[index]["title"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        pages[index]["subtitle"]!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      CustomElevatedButton(
                        text: currentPage == pages.length - 1
                            ? "Finish"
                            : "Next",
                        onPressed: goNext,
                      ),
                      const SizedBox(height: 12),
                      Visibility(
                        visible: currentPage != 0,
                        child: BackButtonn(onPressed: goBack),
                      ),
                    ],
                  ),
                ),
              ),

              /// BUTTONS
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 12),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: ElevatedButton(
              //           onPressed: goBack,
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor: Colors.black,
              //             side: const BorderSide(color: Colors.yellow),
              //             padding: const EdgeInsets.symmetric(vertical: 13),
              //           ),
              //           child: const Text(
              //             "Back",
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ),
              //       ),
              //       const SizedBox(width: 10),
              //       Expanded(
              //         child: ElevatedButton(
              //           onPressed: goNext,
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor: Colors.yellow,
              //             foregroundColor: Colors.black,
              //             padding: const EdgeInsets.symmetric(vertical: 13),
              //           ),
              //           child: const Text(
              //             "Next",
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
