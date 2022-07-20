import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/view/Screens/HomeScreen/AppCubit/AppCubit.dart';
import 'package:netflixclone/view/Screens/HomeScreen/AppCubit/AppStates.dart';
import 'package:netflixclone/view/widgets/CustomColumn/CustomColumn.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>
      (
      listener: (context,state){},
      builder: (context,state)
      {
        // var cubit=BlocProvider.of<AppCubit>(context);
        var popularModel = BlocProvider.of<AppCubit>(context).popularModel;
        var upcomingMoviesModel = BlocProvider.of<AppCubit>(context).upcomingMoviesModel;
        var topRatedModel = BlocProvider.of<AppCubit>(context).topRatedModel;

        return SafeArea(
          child: Scaffold
            (
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                   CustomColumn(text: 'Popular',length: popularModel?.results.length,
                   model: popularModel
                   ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomColumn(text: 'Top Rated',length: topRatedModel?.results.length,
                        model: topRatedModel
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomColumn(text: 'Upcoming',length: upcomingMoviesModel?.results.length,
                        model: upcomingMoviesModel
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),







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
