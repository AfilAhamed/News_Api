import 'package:flutter/material.dart';
import '../../model/article_model.dart/articlemodel.dart';
import '../../services/category_new.dart';

class CategoryController extends ChangeNotifier {
  bool loading = true;

  List<ArticleModel> articlnews = [];

  getCategoryNews(category) async {
    CategoryNewsServices newsServices = CategoryNewsServices();
    await newsServices.fetchCategoryNews(category);
    articlnews = newsServices.news;

    loading = false;

    notifyListeners();
  }
}
