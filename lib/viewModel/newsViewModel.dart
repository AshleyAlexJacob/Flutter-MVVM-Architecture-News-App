import 'package:intl/intl.dart';
import 'package:mvvm_news_app/model/newsArticle.dart';

class NewsViewModel {
  NewsArticle _modelNewsArticle;
  NewsViewModel({NewsArticle article}) : _modelNewsArticle = article;
  String get title {
    return _modelNewsArticle.title;
  }

  String get description {
    return _modelNewsArticle.description;
  }

  String get dateTime {
    final dateTime = DateFormat('yyyy-mm-ddTHH:mm:ssZ')
        .parse(_modelNewsArticle.publishedAt, true);

    return DateFormat.yMMMMEEEEd('en-us').format(dateTime);
  }

  String get url {
    return _modelNewsArticle.url;
  }

  String get urlToImage {
    return _modelNewsArticle.urlToImage;
  }
}
