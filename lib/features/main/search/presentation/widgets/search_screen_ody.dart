import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/main/search/presentation/cubit/cubit/search_cubit.dart';

class SearchScreenbody extends StatefulWidget {
  const SearchScreenbody({super.key});

  @override
  State<SearchScreenbody> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreenbody> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().loadAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: TextField(
                controller: controller,
                onChanged: (value) {
                  context.read<SearchCubit>().search(value);
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search',
                  filled: true,
                  fillColor: const Color(0xFF2D2D2D),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is SearchEmpty) {
                    return Center(
                      child: Image.asset(
                        'assets/image/Empty.png',
                        width: 120.w,
                      ),
                    );
                  }

                  if (state is SearchNoResult) {
                    return Center(
                      child: Image.asset(
                        'assets/image/Empty.png',
                        width: 120.w,
                      ),
                    );
                  }

                  if (state is SearchSuccess) {
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.65,
                          ),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];

                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) =>
                            //         DetailsScreen(movie: movie),
                            //   ),
                            // );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              movie.posterImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }

                  if (state is SearchError) {
                    return Center(child: Text(state.message));
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
