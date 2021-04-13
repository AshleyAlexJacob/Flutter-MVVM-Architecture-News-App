import 'package:dio/dio.dart';
import 'package:mvvm_news_app/constants/apiKey.dart';
import 'package:mvvm_news_app/model/newsArticle.dart';

class WebService {
  var dio = Dio();
  Future<List<NewsArticle>> getTopHeadLines() async {
    final response = await dio.get(Constants.topHeadLines);
    if (response.statusCode == 200) {
      // 200 for a Good One
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Response Failed');
    }
  }

  Future<List<NewsArticle>> getNewsForCountry(String countryName) async {
    final response = await dio.get(Constants.headlinesCountry(countryName));
    if (response.statusCode == 200) {
      // 200 for a Good One
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Response Failed');
    }
  }
}
