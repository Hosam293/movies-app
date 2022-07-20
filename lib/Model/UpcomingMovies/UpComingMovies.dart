class UpcomingMoviesModel {
  dynamic page;
  List<ResultsModel>results = [];
  DateModel? dates;

  UpcomingMoviesModel.fromJson(Map<String, dynamic>json)
  {
    page = json['page'];
    json['results'].forEach((element)
    {
      results.add(ResultsModel.fromJson(element));
    });
    dates =DateModel.fromJson(json['dates']);

  }


}
class DateModel
{
  String? maximum;
  String? minimum;
  DateModel.fromJson(Map<String,dynamic>json)
  {
    maximum =json['maximum'];
    minimum =json['minimum'];
  }
}

class ResultsModel
{
String? backdropPath;
String? posterPath;
dynamic id;
dynamic voteAverage;
String? title;
String? releaseDate;
String? overview;
ResultsModel.fromJson(Map<String,dynamic>json)
{
  backdropPath=json['backdrop_path'];
  posterPath=json['poster_path'];
  id=json['id'];
  title=json['title'];
  releaseDate=json['release_date'];
  overview=json['overview'];
  voteAverage=json['vote_average'];
}

}