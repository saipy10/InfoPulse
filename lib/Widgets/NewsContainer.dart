import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContainer extends StatefulWidget {
  final String img;
  final String newsHead;
  final String newsCnt;
  final String newsTitle;
  final String newsUrl;

  const NewsContainer({
    super.key,
    required this.img,
    required this.newsHead,
    required this.newsCnt,
    required this.newsTitle,
    required this.newsUrl,
  });

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: 380,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            image: DecorationImage(
              image: NetworkImage(
                widget.img,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                stops: [0.1, 0.3],
                colors: [
                  Colors.black54,
                  Colors.black12,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    (widget.newsTitle.length >= 80)
                        ? "${widget.newsTitle.toString().substring(0, 80)}..."
                        : widget.newsTitle.toString(),
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            (widget.newsHead.length > 150)
                ? "${widget.newsHead.toString().substring(0, 150)}..."
                : widget.newsHead.toString(),
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            (widget.newsCnt.length > 15)
                ? "${widget.newsCnt.toString().substring(0, widget.newsCnt.length - 15)}..."
                : widget.newsCnt.toString(),
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w300,
              fontSize: 17,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              "swipe left for quick read",
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    launchUrl(Uri.parse(widget.newsUrl));
                  });
                },
                child: SizedBox(
                  height: 60,
                  width: 380,
                  child: Stack(
                    children: [
                      ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.img),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Tap to read more about news",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
