import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/Constants/EndPoints.dart';
import 'package:netflixclone/view/Screens/CategoryScreen/CategoryScreen.dart';
import 'package:netflixclone/view/Screens/HomeScreen/AppCubit/AppCubit.dart';
import 'package:netflixclone/view/Screens/HomeScreen/AppCubit/AppStates.dart';
import 'package:netflixclone/view/Screens/VideoScreen/VideoScreen.dart';
import 'package:netflixclone/view/widgets/CustomCard/CustomCard.dart';
import 'package:netflixclone/view/widgets/MoviesData/MoviesData.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomColumn extends StatelessWidget {
  String text;
  var length;
  var model;

  CustomColumn({required this.text, required this.length, this.model});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit= BlocProvider.of<AppCubit>(context);
        var videoModel =BlocProvider.of<AppCubit>(context).videoModel;
        return ConditionalBuilder(
          condition: model != null,
          builder: (context) {
            return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20),
                    ),
                    TextButton(
                        onPressed: ()
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryScreen(
                            model:model, text: text ,
                          )));
                        },
                        child: Text(
                          'See More',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 15),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                SingleChildScrollView(
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
                                            image: NetworkImage('$IMAGE_PATH${model!.results[index].backdropPath}'
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
                                            image: NetworkImage('$IMAGE_PATH${model!.results[index].posterPath}'
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
                                                      '${model.results[index].title}',
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
                                                    '${model.results[index].releaseDate}',
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
                                                    '${model.results[index].voteAverage}/10',
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
                                                  '${model!.results[index].overview}',
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

                                                  cubit.getSimilarMovies(movieId: model.results[index].id);

                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => MoviesData(
                                                            image:
                                                            '$IMAGE_PATH${model.results[index].posterPath}',
                                                            title:
                                                            '${model.results[index].title}',
                                                            overview:
                                                            '${model.results[index].overview}',
                                                            rate:
                                                            model.results[index].voteAverage,
                                                            movieId: model.results[index].id,
                                                          )));
                                                }, child: Text(
                                                  'See more' ,style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1!.copyWith(
                                                  fontSize: 15,
                                                ),
                                                )
                                                ),
                                              ),
                                              IconButton(onPressed: ()
                                              {

                                                //
                                                // cubit.getMoviesVideos(movieId: model.results[index].id);
                                                // YoutubePlayerController _controller = YoutubePlayerController(
                                                //   initialVideoId: '5c9294240e0a267cd516835f',
                                                //   flags: YoutubePlayerFlags(
                                                //     autoPlay: true,
                                                //     mute: true,
                                                //   ),
                                                // );
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                                              }, icon: Icon(Icons.play_arrow))

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
                              '$IMAGE_PATH${model!.results[index].backdropPath}',
                            ))),
                  ),
                ),
              ],
            );
          },
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
