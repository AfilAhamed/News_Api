import 'dart:convert';

import 'package:news_api/model/article_model.dart/articlemodel.dart';
import 'package:http/http.dart' as http;

class NewsServices {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=9a922478bde34c1298d3aba0b7a4f66d';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['context'],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
