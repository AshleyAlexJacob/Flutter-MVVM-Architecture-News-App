import 'package:flutter/material.dart';
import 'package:mvvm_news_app/viewModel/newsViewModel.dart';
import 'package:mvvm_news_app/widgets/circleImage.dart';

class DetailsScreen extends StatelessWidget {
  final NewsViewModel article;
  DetailsScreen({@required this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          article.title,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
        child: Column(
          children: [
            Container(
              height: 300.0,
              child: CircleImage(image: article.urlToImage),
            ),
            Center(
              child: Text(
                article.dateTime,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Center(
              child: Text(
                article.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Text(
                article.description,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
