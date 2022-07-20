class TopRatedModel {
  dynamic page;
  List<ResultsModel>results = [];

  TopRatedModel.fromJson(Map<String, dynamic>json)
  {
    page = json['page'];
    json['results'].forEach((element)
    {
      results.add(ResultsModel.fromJson(element));
    });

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