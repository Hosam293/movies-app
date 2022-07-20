import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/Constants/EndPoints.dart';
import 'package:netflixclone/view/Screens/HomeScreen/AppCubit/AppCubit.dart';
import 'package:netflixclone/view/Screens/HomeScreen/AppCubit/AppStates.dart';
import 'package:netflixclone/view/widgets/CustomCard/CustomMovieCard.dart';
import 'package:netflixclone/view/widgets/MoviesData/MoviesData.dart';

class CategoryScreen extends StatelessWidget {
  dynamic model;
  String text;
  List<int> pages = [1, 2, 3, 4, 5];

  CategoryScreen({this.model, required this.text});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<AppCubit>(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.amberAccent,
                size: 25,
              ),
            ),
            title: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.amberAccent, fontSize: 25),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search_outlined,
                    size: 30,
                    color: Colors.amberAccent,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ConditionalBuilder(
                condition: model != null,
                builder: (context) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CarouselSlider.builder(
                      itemCount: model?.results.length,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image(
                              image: NetworkImage(
                                  '$IMAGE_PATH${model!.results[index].backdropPath}'),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              alignment: Alignment.bottomCenter,
                              color: Colors.black.withOpacity(.4),
                              width: double.infinity,
                              height: 40,
                              child: Text(
                                '${model.results[index].title}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: Colors.teal, fontSize: 20),
                              ),
                            )
                          ],
                        );
                      },
                      options: CarouselOptions(
                        height: 200,
                        scrollDirection: Axis.horizontal,
                        reverse: false,
                        initialPage: 0,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 5.0,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(3),
                      shrinkWrap: true,
                      childAspectRatio: 1 / 1.8,
                      children: List.generate(model!.results.length, (index) {
                        return CustomMovieCard(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context)
                                    {
                                      cubit.getSimilarMovies(movieId: model.results[index].id);

                                      return MoviesData(
                                        image:
                                        '$IMAGE_PATH${model.results[index].posterPath}',
                                        title:
                                        '${model.results[index].title}',
                                        overview:
                                        '${model.results[index].overview}',
                                        rate:
                                        model.results[index].voteAverage,
                                        movieId: model.results[index].id,
                                      );
                                    }));
                          },
                          image:
                              '$IMAGE_PATH${model.results[index].posterPath}',
                          title: '${model.results[index].title}',
                          rate: model.results[index].voteAverage,
                          date: '${model.results[index].releaseDate}',
                        );
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          pages.length,
                          (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (model == cubit.popularModel) {
                                      cubit.getPopularMovies(
                                          page: pages[index]);
                                      model = cubit.popularModel;
                                    } else if (model == cubit.topRatedModel) {
                                      cubit.getTopRatedMovies(
                                          page: pages[index]);
                                      model = cubit.topRatedModel;
                                    } else {
                                      cubit.getUpcomingMovies(
                                          page: pages[index]);
                                      model = cubit.upcomingMoviesModel;
                                    }
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.amberAccent,
                                    height: 20,
                                    width: 20,
                                    child: Text('${pages[index]}'),
                                  ),
                                ),
                              )),
                    )
                  ],
                ),
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
        );
      },
    );
  }
}
