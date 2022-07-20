import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/Constants/EndPoints.dart';
import 'package:netflixclone/Controller/DioHelper.dart';
import 'package:netflixclone/Model/MoviesVideo/VideosModel.dart';
import 'package:netflixclone/Model/Popular%20Movies/PopularModel.dart';
import 'package:netflixclone/Model/SearchMovies/SearchMovies.dart';
import 'package:netflixclone/Model/Simliar%20Movies/SimilarMovies.dart';
import 'package:netflixclone/Model/TopRatedMoives/TopRatedMovies.dart';
import 'package:netflixclone/Model/UpcomingMovies/UpComingMovies.dart';
import 'package:netflixclone/view/Screens/HomeScreen/AppCubit/AppStates.dart';

class AppCubit extends Cubit<AppStates>
{
AppCubit():super(AppInitialState());

static AppCubit get(context)=>BlocProvider.of<AppCubit>(context);
PopularModel? popularModel;
getPopularMovies({ dynamic page=1})
{
  print('hello');
  emit(GetPopularLoadingState());
  DioHelper.getData(url: POPULAR_MOVIES,query:
  {
    'api_key':API_KEY,
    'language':LANGUAGE,
    'page':page
  }).then((value)
  {
    print(value);
    popularModel =PopularModel.fromJson(value.data);
    emit(GetPopularSuccessState());
  }).catchError((error)
  {
    print(error.toString());
    emit(GetPopularErrorState());
  });
}
UpcomingMoviesModel? upcomingMoviesModel;

getUpcomingMovies({ dynamic page=1})
{
  print('hello');
  emit(GetPopularLoadingState());
  DioHelper.getData(url: UPCOMING_MOVIES,query:
  {
    'api_key':API_KEY,
    'language':LANGUAGE,
    'page':page
  }).then((value)
  {
    print(value);
    upcomingMoviesModel =UpcomingMoviesModel.fromJson(value.data);
    emit(GetPopularSuccessState());
  }).catchError((error)
  {
    print(error.toString());
    emit(GetPopularErrorState());
  });
}

TopRatedModel? topRatedModel;
getTopRatedMovies({ dynamic page=1})
{
  print('hello3');
  emit(GetPopularLoadingState());
  DioHelper.getData(url: TOPRATED_MOVIES,query:
  {
    'api_key':API_KEY,
    'language':LANGUAGE,
    'page':page
  }).then((value)
  {
    print(value);
    topRatedModel =TopRatedModel.fromJson(value.data);
    emit(GetPopularSuccessState());
  }).catchError((error)
  {
    print(error.toString());
    emit(GetPopularErrorState());
  });
}
SearchModel? searchModel;
getSearchMovies({ String? value })
{
  searchModel;
  print('hello Search');
  emit(GetPopularLoadingState());
  DioHelper.getData(url: '/3/search/movie',query:
  {
    'api_key':API_KEY,
    'language':LANGUAGE,
    'page':'1',
    'query':value
  }).then((value)
  {
    print(value);
    searchModel =SearchModel.fromJson(value.data);
    emit(GetPopularSuccessState());
  }).catchError((error)
  {
    print(error.toString());
    emit(GetPopularErrorState());
  });
}
SimilarMoviesModel? similarMoviesModel;
getSimilarMovies({ dynamic page=1,required dynamic movieId})
{
  print('hellosfdfsf');
  emit(GetPopularLoadingState());
  DioHelper.getData(url: '3/movie/$movieId/similar',query:
  {
    'api_key':API_KEY,
    'language':LANGUAGE,
    'page':page
  }).then((value)
  {
    print(value);
    similarMoviesModel =SimilarMoviesModel.fromJson(value.data);
    emit(GetPopularSuccessState());
  }).catchError((error)
  {
    print(error.toString());
    emit(GetPopularErrorState());
  });


}
VideoModel? videoModel;
getMoviesVideos({required dynamic movieId})
{
  print('hellosfdfsf');
  emit(GetPopularLoadingState());
  DioHelper.getData(url: '3/movie/$movieId/videos',query:
  {
    'api_key':API_KEY,
    'language':LANGUAGE,
  }).then((value)
  {
    print(value);
    videoModel =VideoModel.fromJson(value.data);
    emit(GetPopularSuccessState());
  }).catchError((error)
  {
    print(error.toString());
    emit(GetPopularErrorState());
  });


}



}