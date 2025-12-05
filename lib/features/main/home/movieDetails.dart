import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';




class MovieDetails extends StatelessWidget {
  final String image;
  final String title;
  final String year;
  final double rating;
  final List<String> screenshots;

  const MovieDetails({
    super.key,
    required this.image,
    required this.title,
    required this.year,
    required this.rating,
    required this.screenshots,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryblack,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  image,
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(
                  height: 350,
                  width: double.infinity,
                  color: ColorsManager.primaryblack.withOpacity(0.45),
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
              ],
            ),

            const SizedBox(height: 20),


            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: ColorsManager.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),


            Text(
              year,
              style: const TextStyle(
                color: ColorsManager.white,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 20),


            Container(
              width: 260,
              height: 50,
              decoration: BoxDecoration(
                color: ColorsManager.red,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Watch',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 25),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(children: const [
                  Icon(Icons.favorite, color: ColorsManager.primaryyellow),
                  SizedBox(width: 5),
                  Text("15", style: TextStyle(color: ColorsManager.white)),
                ]),

                Row(children: const [
                  Icon(Icons.access_time, color: ColorsManager.primaryyellow),
                  SizedBox(width: 5),
                  Text("90", style: TextStyle(color: ColorsManager.white)),
                ]),

                Row(children: [
                  const Icon(Icons.star, color: ColorsManager.primaryyellow),
                  const SizedBox(width: 5),
                  Text(
                    rating.toString(),
                    style: const TextStyle(color: ColorsManager.white),
                  ),
                ]),
              ],
            ),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: const [
                  Text(
                    'Screen Shots',
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorsManager.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),


            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: screenshots.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      screenshots[index],
                      width: 180,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
