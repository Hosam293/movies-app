import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/view/Screens/HomeScreen/AppCubit/AppCubit.dart';
import 'package:netflixclone/view/Screens/HomeScreen/AppCubit/AppStates.dart';
import 'package:netflixclone/view/widgets/CustomCard/CustomCard.dart';

import '../../../Constants/EndPoints.dart';

class MoviesData extends StatelessWidget {
  String? image;
  dynamic model;
  dynamic movieId;

  MoviesData(
      {required this.image,
      required this.title,
      required this.overview,
      required this.rate,
      this.model,this.movieId});

  String? title;
  String? overview;
  dynamic rate;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit= BlocProvider.of<AppCubit>(context);

        var similarMovies =BlocProvider.of<AppCubit>(context).similarMoviesModel;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image:
                      NetworkImage('https://image.tmdb.org/t/p/original$image'),
                  fit: BoxFit.fitHeight,
                  colorFilter: const ColorFilter.mode(
                      Colors.black, BlendMode.softLight),
              opacity: .4
              )
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(40.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FlipCard(
                      fill: Fill.fillBack,
                      // Fill the back side of the card to make in the same size as the front.
                      direction: FlipDirection.HORIZONTAL,
                      // default
                      front: Container(
                        height: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/original$image'),
                          fit: BoxFit.cover,
                        )),
                      ),
                      back: Container(
                        height: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/original$image'),
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '$title',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 15,
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: <Color>[
                                          Colors.teal,
                                          Colors.deepPurpleAccent,
                                          Colors.red
                                          //add more color here.
                                        ],
                                      ).createShader(const Rect.fromLTWH(
                                          0.0, 0.0, 200.0, 100.0))),
                          ),
                        ),
                        Text(
                          '$rate/10',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 15,
                                  foreground: Paint()
                                    ..shader = const LinearGradient(
                                      colors: <Color>[
                                        Colors.teal,
                                        Colors.deepPurpleAccent,
                                        Colors.red
                                        //add more color here.
                                      ],
                                    ).createShader(const Rect.fromLTWH(
                                        0.0, 0.0, 200.0, 100.0))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '$overview',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: <Color>[
                                Colors.teal,
                                Colors.teal,
                                Colors.red
                                //add more color here.
                              ],
                            ).createShader(
                                const Rect.fromLTWH(50.0, 0.0, 200.0, 100.0))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Similar movies',style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white,fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ConditionalBuilder(
                     condition: similarMovies != null,
                      builder: (context)=>SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              5,
                                  (index) => GestureDetector(
                                  onTap: ()
                                  {
                                    showBottomSheet(
                                        context: context,
                                        builder: (context) => Container(
                                          padding: const EdgeInsetsDirectional.all(4),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              image: DecorationImage(
                                                  image: NetworkImage('$IMAGE_PATH${similarMovies!.results[index].backdropPath}'
                                                  ),
                                                  fit: BoxFit.cover,
                                                  opacity: .4
                                              )

                                          ),
                                          height: 180,
                                          width: double.infinity,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              Card(
                                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                                elevation: 0.0,
                                                child: Image(
                                                  image: NetworkImage('$IMAGE_PATH${similarMovies.results[index].posterPath}'
                                                  ),
                                                  height: 150,
                                                  width: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children:
                                                  [
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            '${similarMovies.results[index].title}',
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .bodyText1!
                                                                .copyWith(fontSize: 18),
                                                            maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                          ),

                                                        ),
                                                        IconButton(onPressed: ()
                                                        {
                                                          Navigator.pop(context);
                                                        }, icon: const Icon(Icons.exit_to_app_outlined))
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '${similarMovies.results[index].releaseDate}',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .caption,
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          '${similarMovies.results[index].voteAverage}/10',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .caption,
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        '${similarMovies.results[index].overview}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!.copyWith(
                                                            fontSize: 15,
                                                            color: Colors.red
                                                        ),
                                                        maxLines: 4,
                                                        overflow: TextOverflow.ellipsis,

                                                      ),
                                                    ),
                                                    Container(
                                                      alignment: AlignmentDirectional.centerEnd,
                                                      child: TextButton(onPressed: ()
                                                      {
                                                        cubit.getSimilarMovies(movieId: similarMovies.results[index].id);
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => MoviesData(
                                                                  image:
                                                                  '$IMAGE_PATH${similarMovies.results[index].posterPath}',
                                                                  title:
                                                                  '${similarMovies.results[index].title}',
                                                                  overview:
                                                                  '${similarMovies.results[index].overview}',
                                                                  rate:
                                                                  similarMovies.results[index].voteAverage,
                                                                  movieId: similarMovies.results[index].id,
                                                                )));
                                                      }, child: Text(
                                                        'See more' ,style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1!.copyWith(
                                                        fontSize: 15,
                                                      ),
                                                      )
                                                      ),
                                                    )

                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ));
                                  }

                                  ,
                                  child: CustomCard(
                                    image:
                                    '$IMAGE_PATH${similarMovies!.results[index].posterPath}',
                                  ))),
                        ),
                      ),
                      fallback: (context)=>Center(child: CircularProgressIndicator()),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
