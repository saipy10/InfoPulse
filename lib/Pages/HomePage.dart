import 'package:flutter/material.dart';
import 'package:infopulse/Widgets/NewsContainer.dart';
import 'package:infopulse/controller/FetchNews.dart';
import 'package:infopulse/model/newsArt.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<NewsArt>> newsArt = fetchNews();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 28, 28, 28),
        body: FutureBuilder(
          future: fetchNews(),
          builder: (context, snapshot) {
            return PageView.builder(
            controller: PageController(initialPage: 0),
            scrollDirection: Axis.vertical,
            itemCount: 20,            
            itemBuilder: (context, index) {
              return NewsContainer(
                img: snapshot.data![index].img.toString(),
                newsTitle: snapshot.data![index].newsTitle.toString(),
                newsHead: snapshot.data![index].newsHead.toString(),
                newsCnt: snapshot.data![index].newsCnt.toString(),
                newsUrl: snapshot.data![index].newsUrl.toString(),
              );
            },
          );

          },
        ),
      ),
    );
  }
}
