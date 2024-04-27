import 'dart:convert';
import 'package:http/http.dart';
import 'package:infopulse/Widgets/AlternateImage.dart';
import 'package:infopulse/model/newsArt.dart';

Future<List<NewsArt>> fetchNews() async {
  List<NewsArt> newsArticle = [];
  Response response = await get(
    Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=d8041a6fe3554578aba4d93a1e07fde6"),
  );

  Map data = jsonDecode(response.body);
  List art = data["articles"];

  if (response.statusCode == 200) {
    for (Map i in art) {
      NewsArt newNews = NewsArt(
        img: i["urlToImage"] ?? AlterImage,
        newsHead: i["description"] ?? " ",
        newsCnt: i["content"] ?? " ",
        newsTitle: i["title"] ?? " ",
        newsUrl: i["url"] ?? " ",
      );
      newsArticle.add(newNews);
    }
    return newsArticle;
  } else {
    return newsArticle;
  }
}
