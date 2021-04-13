import 'package:flutter/cupertino.dart';
import 'package:mvvm_news_app/model/newsArticle.dart';
import 'package:mvvm_news_app/services/services.dart';
import 'package:mvvm_news_app/viewModel/newsViewModel.dart';

enum LoadingStatus { completed, searching, empty }

class ListNewsViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsViewModel> articles = <NewsViewModel>[];
  // methods to fetch news
  void fetchTopNewsHeadlines() async {
    // What we are going to fetch from Db Service

    List<NewsArticle> _newsArticle = await WebService().getTopHeadLines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    this.articles =
        _newsArticle.map((article) => NewsViewModel(article: article)).toList();
    if (this.articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  // To fetch by country wise
  void fetchTopNewsHeadlinesByCountry(String country) async {
    // What we are going to fetch from Db Service

    List<NewsArticle> _newsArticle =
        await WebService().getNewsForCountry(country);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    this.articles =
        _newsArticle.map((article) => NewsViewModel(article: article)).toList();
    if (this.articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
