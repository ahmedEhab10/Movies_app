import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';

class MovieDetails extends StatelessWidget {
  final String? image;
  final String? title;
  final String? year;
  final double? rating;
  final List<String>? screenshots;

  const MovieDetails({
    super.key,
    this.image,
    this.title,
    this.year,
    this.rating,
    this.screenshots,
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset(
                    'assets/image/Move_poser4.png',

                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
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
              'Titanic',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                color: ColorsManager.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              '1997, Drama, Romance',
              style: const TextStyle(color: ColorsManager.white, fontSize: 18),
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
                Row(
                  children: const [
                    Icon(Icons.favorite, color: ColorsManager.primaryyellow),
                    SizedBox(width: 5),
                    Text("15", style: TextStyle(color: ColorsManager.white)),
                  ],
                ),

                Row(
                  children: const [
                    Icon(Icons.access_time, color: ColorsManager.primaryyellow),
                    SizedBox(width: 5),
                    Text("90", style: TextStyle(color: ColorsManager.white)),
                  ],
                ),

                Row(
                  children: [
                    const Icon(Icons.star, color: ColorsManager.primaryyellow),
                    const SizedBox(width: 5),
                    Text(
                      rating.toString(),
                      style: const TextStyle(color: ColorsManager.white),
                    ),
                  ],
                ),
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
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      height: 300,
                      'assets/image/Move_poser3.png',
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
