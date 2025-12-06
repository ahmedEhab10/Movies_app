import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import '../../Auth/data/Models/movie.dart';



class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Movie> filteredMovies = [];

  void filterMovies(String value) {
    String search = value.toLowerCase();

    setState(() {

      if (search.isEmpty) {
        filteredMovies = [];
      } else {

        filteredMovies = moviesList.where((movie) {
          return movie.title.toLowerCase().contains(search);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryblack,

      appBar: AppBar(
        backgroundColor: ColorsManager.primaryblack,
        elevation: 0,
        title: Text(
          "Search",
          style: TextStyle(
            color: ColorsManager.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [


            TextField(
              onChanged: filterMovies,
              cursorColor: ColorsManager.primaryyellow,
              style: TextStyle(
                color: ColorsManager.primaryyellow,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: ColorsManager.white),
                hintText: "Search",
                hintStyle: TextStyle(color: ColorsManager.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: ColorsManager.primaryyellow, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: ColorsManager.primaryyellow, width: 2),
                ),
              ),
            ),

            SizedBox(height: 20),


            if (filteredMovies.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    "search",
                    style: TextStyle(color: ColorsManager.white, fontSize: 17),
                  ),
                ),
              )
            else


              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: filteredMovies.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    return MovieItem(movie: filteredMovies[index]);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
