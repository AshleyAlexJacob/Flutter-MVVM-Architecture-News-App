import 'package:flutter/material.dart';
import 'package:mvvm_news_app/view/detailsScreen.dart';
import 'package:mvvm_news_app/viewModel/newsViewModel.dart';
import 'package:mvvm_news_app/widgets/circleImage.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsViewModel> articles;
  NewsGrid({this.articles});
  _showNewsDetailPage(BuildContext context, NewsViewModel vM) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(
          article: vM,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: this.articles.length,
        itemBuilder: (context, index) {
          var article = articles[index];
          return InkWell(
            onTap: () {
              _showNewsDetailPage(context, article);
            },
            child: GridTile(
              child: Container(
                child: CircleImage(image: article.urlToImage),
              ),
              footer: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0.0),
                child: Text(
                  article.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          );
        });
  }
}
