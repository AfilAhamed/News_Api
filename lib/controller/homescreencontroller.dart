import 'package:flutter/material.dart';
import 'package:news_api/model/article_model.dart/articlemodel.dart';
import 'package:news_api/services/article_news.dart';

class HomeControl extends ChangeNotifier {
  List<ArticleModel> articles = <ArticleModel>[];
  bool loading = true;

  getNews() async {
    ArticleNewsServices newsServices = ArticleNewsServices();
    await newsServices.fetchArticleNews();
    articles = newsServices.news;

    loading = false;

    notifyListeners();
  }
}
